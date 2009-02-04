require 'redmine'

Redmine::Plugin.register :redmine_download_counter do
  name 'Download Counter'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com'
  author_url 'http://www.littlestreamsoftware.com'
  description "Displays the total number of downloads in the sidebars of the projects"
  version '0.1.0'
end

class DownloadCounterHook  < Redmine::Hook::ViewListener
  def view_layouts_base_sidebar(context={ })
    response = ''
    if context[:project]
      downloads = 0
      downloads += context[:project].attachments.collect(&:downloads).sum
      downloads += context[:project].versions.collect(&:attachments).flatten.collect(&:downloads).sum
      
      response = content_tag(:div,
                             content_tag(:h3, l(:download_counter_text_download_counter)) + 
                             link_to("#{downloads.to_s} #{l(:download_counter_text_downloads)}", {
                                       :controller => 'projects',
                                       :action => 'list_files',
                                       :id => context[:project],
                                       :protocol => Setting.protocol,
                                       :host => Setting.host_name
                                     },
                                     :class => 'icon icon-package'
                                     
                                     ),
                             :id => "download-counter"
                             
                             )
    end
    return response
  end
  
  def view_layouts_base_html_head(context={ })
    return <<EOCSS
        <style type="text/css">
        #download-counter { margin: 10px 0px; font-weight: bold; }
        </style>
EOCSS
  end

end