class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, except: [:new, :create, :index]

  def index
    @tasks = @project.tasks.order(:position)
  end

  def show
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      flash[:notice] = 'Task created successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Task creation failed'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'Task updated successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Task update failed'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash.now[:alert] = 'task destroyed!'
    redirect_to root_path
  end

  def move
    @task.update(position: params[:position].to_i + 1)
    head :ok
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :importance, :project_id)
  end
end
