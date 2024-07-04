class DashboardController < ApplicationController
  def index
    @projects = current_user.projects.includes(:tasks).order(:position)
  end
end
