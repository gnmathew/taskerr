class DashboardController < ApplicationController
  def index
    @projects = Project.includes(:tasks)
  end
end
