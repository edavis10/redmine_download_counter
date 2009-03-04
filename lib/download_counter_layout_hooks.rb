module DownloadCounterPlugin
  module Hooks
    class LayoutHook  < Redmine::Hook::ViewListener
      def view_layouts_base_sidebar(context={ })
        response = ''
        downloads = DownloadCounter.downloads_for(context[:project])
        if context[:project]
          text = link_to("#{downloads.to_s} #{l(:download_counter_text_downloads)}", {
                           :controller => 'projects',
                           :action => 'list_files',
                           :id => context[:project],
                           :only_path => true
                         },
                         :class => 'icon icon-package'
                         )

        else
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
  end
end
