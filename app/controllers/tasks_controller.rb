class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(permitted_params)
    if @task.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to tasks_path }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  def update
    task = Task.find(permitted_params[:id].to_i)
    task.update(permitted_params)
    render task
  end

  def permitted_params
    p params
    params.require(:task).permit(:id, :name, :completed)
  end
end
