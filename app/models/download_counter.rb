class DownloadCounter
  def self.downloads_for(project=nil)
    downloads = 0
    if project
      downloads += project.attachments.collect(&:downloads).sum
      downloads += project.versions.collect(&:attachments).flatten.collect(&:downloads).sum
    else
      # All projects
      Project.visible.each do |project|
        downloads += project.attachments.collect(&:downloads).sum
        downloads += project.versions.collect(&:attachments).flatten.collect(&:downloads).sum
      end
    end

    return downloads
  end
end
