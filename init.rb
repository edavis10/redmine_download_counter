require 'redmine'

Redmine::Plugin.register :redmine_download_counter do
  name 'Download Counter'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com'
  author_url 'http://www.littlestreamsoftware.com'
  description "Displays the total number of downloads in the sidebar of the projects"
  version '0.1.0'

  # TODO: Requires Redmine 0.8.2 or higher
end

class DownloadCounterHook  < Redmine::Hook::ViewListener
  def view_layouts_base_sidebar(context={ })
    response = ''
    downloads = 0
    if context[:project]
      downloads += context[:project].attachments.collect(&:downloads).sum
      downloads += context[:project].versions.collect(&:attachments).flatten.collect(&:downloads).sum

      text = link_to("#{downloads.to_s} #{l(:download_counter_text_downloads)}", {
                       :controller => 'projects',
                       :action => 'list_files',
                       :id => context[:project],
                       :only_path => true
                     },
                     :class => 'icon icon-package'
                     )

    else
      # All projects
      if Project.respond_to?(:visible)
        projects = Project.visible
      else
        projects = Project.find(:all, :conditions => Project.visible_by) # 0.8.x
      end
      
      projects.each do |project|
        downloads += project.attachments.collect(&:downloads).sum
        downloads += project.versions.collect(&:attachments).flatten.collect(&:downloads).sum
      end

      text = content_tag(:p, "#{downloads.to_s} #{l(:download_counter_text_downloads)}", :class => 'icon icon-package')
    end      

    response = content_tag(:div,
                           content_tag(:h3, l(:download_counter_text_download_counter)) + text,
                           :id => "download-counter"
                           )
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
