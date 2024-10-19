class TasksController < ApplicationController
  before_action :find_list
  before_action :find_task, only: %i[show destroy]

  def new
    @task = Task.new(list: @list)
  end

  def show
  end

  def create 
    task = @list.tasks.create(task_params)

    redirect_to lists_path
  end

  def destroy
    @task.destroy!

    redirect_to lists_path
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_task
    @task = @list.tasks.find(params[:id])
  end

  def task_params
    params.permit(:title, :description)
  end
end