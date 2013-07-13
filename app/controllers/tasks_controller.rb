class TasksController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @task=Task.new(params[:task])
  end
  
  def create
    @task=Task.new(params[:task])
    if @task.save
      redirect_to @task.project
    else
      render 'new'
    end
  end

#   def show
#     @task=Task.find(params[:id])
#   end

  def edit
    @task=Task.find(params[:id])
  end
  
  def update
    @task=Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task.project
    else
      render 'edit'
    end
  end
  
  def destroy
    @task=Task.find(params[:id]).destroy
    redirect_to @task.project
  end

#   def index
#     @tasks=Task.all
#   end
  
end
