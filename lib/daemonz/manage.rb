require 'posix/spawn'

module Daemonz
  # Starts daemons, yields, stops daemons. Intended for tests.
  def self.with_daemons(logger = 'rails')
    begin
      safe_start :force_enabled => true, :override_logger => logger
      yield
    ensure
      safe_stop :force_enabled => true
    end
  end

  # Complete startup used by rake:start and at Rails plug-in startup.
  def self.safe_start(options = {})
    daemonz_config = Rails.root.join 'config', 'daemonz.yml'
    Daemonz.configure daemonz_config, options

    if Daemonz.config[:is_master]
      Daemonz.configure_daemons
      Daemonz.start_daemons!
    end
  end

  # Complete shutdown used by rake:start and at Rails application exit.
  def self.safe_stop(options = {})
    if options[:configure]
      daemonz_config = Rails.root.join 'config', 'daemonz.yml'
      Daemonz.configure daemonz_config, options
    end
    if Daemonz.config[:is_master]
      if options[:configure]
        Daemonz.configure_daemons
      end
      Daemonz.stop_daemons!
      Daemonz.release_master_lock
    end
  end

  def self.start_daemons!
    if Daemonz.config[:async_start]
      Thread.new { start_daemons_sync }
    else
      start_daemons_sync
    end
  end

  def self.start_daemons_sync
    begin
      @daemons.each { |daemon| start_daemon! daemon }
    rescue Exception => e
      logger.warn "Daemonz startup process failed. #{e.class}: #{e}\n" +
                  e.backtrace.join("\n")
    ensure
      logger.flush
    end
  end

  def self.stop_daemons!
    @daemons.reverse.each { |daemon| stop_daemon! daemon }
  end

  def self.start_daemon!(daemon)
    logger.info "Daemonz killing any old instances of #{daemon[:name]}"
    # cleanup before we start
    kill_process_set daemon[:stop][:cmdline], daemon[:pids],
                     daemon[:kill_patterns],
                     :script_delay => daemon[:delay_before_kill],
                     :verbose => true, :force_script => false

    logger.info "Daemonz starting #{daemon[:name]}: #{daemon[:start][:cmdline]}"
    child = POSIX::Spawn::Child.new daemon[:start][:cmdline]

    unless child.success?
      exit_code = child.status.exitstatus
      logger.warn "Daemonz start script for #{daemon[:name]} failed " +
                  "with code #{exit_code}"
    end
  end

  def self.stop_daemon!(daemon)
    kill_process_set daemon[:stop][:cmdline], daemon[:pids],
                     daemon[:kill_patterns],
                     :script_delay => daemon[:delay_before_kill],
                     :verbose => true, :force_script => true
  end
end
