# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{redmine_download_counter}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Eric Davis"]
  s.date = %q{2009-10-14}
  s.description = %q{Displays the total number of downloads in the sidebar of the projects}
  s.email = %q{edavis@littlestreamsoftware.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "README.rdoc",
     "Rakefile",
     "VERSION",
     "app/controllers/download_counters_controller.rb",
     "app/models/download_counter.rb",
     "app/views/download_counters/index.html.erb",
     "config/locales/en.yml",
     "config/locales/ru.yml",
     "init.rb",
     "lang/en.yml",
     "lang/ru.yml",
     "lib/download_counter_layout_hooks.rb",
     "rails/init.rb"
  ]
  s.homepage = %q{https://projects.littlestreamsoftware.com/projects/TODO}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{redmine_download_counter}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Displays the total number of downloads in the sidebar of the projects}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
