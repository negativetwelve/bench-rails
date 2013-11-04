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

  private

    def project_params
      params.require(:project).permit(:name)
    end


end
