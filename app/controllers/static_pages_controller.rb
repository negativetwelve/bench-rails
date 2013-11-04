class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @projects = current_user.projects
      @project = current_user.recent_project
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
