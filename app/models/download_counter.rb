class DownloadCounter
  def self.downloads_for(project=nil)
    downloads = 0
    if project
      downloads += project.attachments.collect(&:downloads).sum
      downloads += project.versions.collect(&:attachments).flatten.collect(&:downloads).sum
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
    end

    return downloads
  end
end
