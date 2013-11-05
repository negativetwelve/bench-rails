class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    @project.users << current_user
    if @project.save
      flash[:success] = "Successfully created new project: #{@project.name}."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def select_project
    @project = Project.find(params[:project_id])
    current_user.recent_project = @project
    if current_user.save
      flash[:success] = "Switched projects."
    else
      flash[:danger] = "Error switching projects #{current_user.errors.messages}."
    end
    redirect_to root_path
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end


end
