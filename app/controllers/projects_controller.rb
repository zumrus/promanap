class ProjectsController < ApplicationController
  def index
     @projects = Project.all
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
#       flash[:success] = "Welcome to the Sample App!"
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
#       flash[:success] = "Profile updated"
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
