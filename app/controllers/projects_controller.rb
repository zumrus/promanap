class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @projects = (current_user.projects + [Project.find_by_hostid(current_user.id)]).compact
  end
  
  def new
    @project = Project.new(params[:project])
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project
    else
      render 'edit'
    end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    redirect_to projects_path
  end
end
