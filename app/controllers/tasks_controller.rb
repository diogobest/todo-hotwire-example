class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(permitted_params)
    @task.save
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def permitted_params
    params.require(:task).permit(:id, :name, :completed)
  end
end
