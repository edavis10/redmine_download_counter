class DownloadCounter

  def self.all
    counters = { }
    Project.find(:all).each do |project|
      counters[project] = DownloadCounter.downloads_for(project)
    end
    # Sorted by number of downloads DESC
    return counters.sort {|a,b| b[1] <=> a[1]}
  end
  
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
