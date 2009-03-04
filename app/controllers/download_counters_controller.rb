class DownloadCountersController < ApplicationController
  unloadable
  layout 'base'
  before_filter :require_admin

  def index
    @download_counters = DownloadCounter.all
  end
end
