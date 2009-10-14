begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "redmine_download_counter"
    s.summary = "Displays the total number of downloads in the sidebar of the projects"
    s.email = "edavis@littlestreamsoftware.com"
    s.homepage = "https://projects.littlestreamsoftware.com/projects/TODO"
    s.description = "Displays the total number of downloads in the sidebar of the projects"
    s.authors = ["Eric Davis"]
    s.rubyforge_project = "redmine_download_counter" # TODO
    s.files =  FileList[
                        "[A-Z]*",
                        "init.rb",
                        "rails/init.rb",
                        "{bin,generators,lib,test,app,assets,config,lang}/**/*",
                        'lib/jeweler/templates/.gitignore'
                       ]
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

