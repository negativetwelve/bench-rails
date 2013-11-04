class TasksController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project = @project
    @task.requester = current_user
    if @task.save
      flash[:success] = "Successfully created task: #{@task.name}."
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def task_params
      params.require(:task).permit(:name)
    end

end
