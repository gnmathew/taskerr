class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, except: [:new, :create]


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project created successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Project creation failed'
      render :new
    end
  end

  def show;end

  def edit;end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Project update successfully'
    else
      flash.now[:alert] = 'Project update failed'
      render :new
    end
  end

  def destroy
    @project.destroy
    flash.now[:alert] = 'Project destroyed!'
    redirect_to root_path
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status).with_defaults(user_id: current_user.id)
  end


end
