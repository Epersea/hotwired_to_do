class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
    p "IM IN THE TASKS CONTROLLER"
    p @task
  end
end