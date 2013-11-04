class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @projects = current_user.projects
      @project = current_user.projects.first
      @tasks = @project.tasks
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
