module Daemonz
  @logger = Rails.logger

  def self.logger
    @logger || Rails.logger
  end

  def self.configure_logger
    case config[:logger]
    when 'stdout'
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::DEBUG
    when 'stderr'
      @logger = Logger.new(STDERR)
      @logger.level = Logger::DEBUG
    when 'rails'
      @logger = Rails.logger
    else
      @logger = Rails.logger
    end
  end
end
