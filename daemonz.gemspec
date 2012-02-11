# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "daemonz"
  s.version = "0.3.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Victor Costan"]
  s.date = "2012-02-11"
  s.description = "Works with Facebook."
  s.email = "victor@costan.us"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".project",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config_template.yml",
    "daemonz.gemspec",
    "lib/daemonz.rb",
    "lib/daemonz/config.rb",
    "lib/daemonz/generators/config/config_generator.rb",
    "lib/daemonz/generators/config/templates/config.yml",
    "lib/daemonz/generators/config/templates/prepackaged/ferret.yml",
    "lib/daemonz/generators/config/templates/prepackaged/starling.yml",
    "lib/daemonz/generators/daemon/daemon_generator.rb",
    "lib/daemonz/generators/daemon/templates/config.yml",
    "lib/daemonz/generators/daemon/templates/daemon.rb.erb",
    "lib/daemonz/generators/daemon/templates/integration_test.rb.erb",
    "lib/daemonz/killer.rb",
    "lib/daemonz/logging.rb",
    "lib/daemonz/manage.rb",
    "lib/daemonz/master.rb",
    "lib/daemonz/process.rb",
    "lib/daemonz/railtie.rb",
    "lib/daemonz/tasks/daemonz_tasks.rake",
    "test/daemonz_test.rb"
  ]
  s.homepage = "http://github.com/costan/daemonz"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "User authentication for Rails 3 applications."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<posix-spawn>, [">= 0.3.6"])
      s.add_runtime_dependency(%q<simple-daemon>, [">= 0.1.2"])
      s.add_runtime_dependency(%q<rails>, [">= 3.2.0"])
      s.add_runtime_dependency(%q<zerg_support>, [">= 0.1.5"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.21"])
      s.add_development_dependency(%q<flexmock>, [">= 0.9.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_development_dependency(%q<rake>, [">= 0.9.2.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.5"])
    else
      s.add_dependency(%q<posix-spawn>, [">= 0.3.6"])
      s.add_dependency(%q<simple-daemon>, [">= 0.1.2"])
      s.add_dependency(%q<rails>, [">= 3.2.0"])
      s.add_dependency(%q<zerg_support>, [">= 0.1.5"])
      s.add_dependency(%q<bundler>, [">= 1.0.21"])
      s.add_dependency(%q<flexmock>, [">= 0.9.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_dependency(%q<rake>, [">= 0.9.2.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.5"])
    end
  else
    s.add_dependency(%q<posix-spawn>, [">= 0.3.6"])
    s.add_dependency(%q<simple-daemon>, [">= 0.1.2"])
    s.add_dependency(%q<rails>, [">= 3.2.0"])
    s.add_dependency(%q<zerg_support>, [">= 0.1.5"])
    s.add_dependency(%q<bundler>, [">= 1.0.21"])
    s.add_dependency(%q<flexmock>, [">= 0.9.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.3"])
    s.add_dependency(%q<rake>, [">= 0.9.2.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.5"])
  end
end

