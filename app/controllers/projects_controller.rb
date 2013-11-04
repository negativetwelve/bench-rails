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
    @project = Project.find(params[:id])
    current_user.recent_project = @project
    current_user.save
    redirect_to root_path
  end

  private

    def project_params
      params.require(:project).permit(:name)
    end


end
