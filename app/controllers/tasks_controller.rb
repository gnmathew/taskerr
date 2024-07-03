class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, except: [:new, :create]

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
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

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :importance, :project_id)
  end
end
