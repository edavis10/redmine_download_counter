require 'redmine'

require_dependency 'download_counter_layout_hooks'

Redmine::Plugin.register :redmine_download_counter do
  name 'Download Counter'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com'
  author_url 'http://www.littlestreamsoftware.com'
  description "Displays the total number of downloads in the sidebar of the projects"
  version '0.1.0'

  # TODO: Requires Redmine 0.8.2 or higher

  menu :admin_menu, :download_counter, { :controller => 'download_counters', :action => 'index'}, :caption => :download_counter_panel

end
