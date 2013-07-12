class UsersController < ApplicationController
  def index
    @users=User.all
  end
  
  def remove_from_project
    @user=User.find(params[:id])
    @project=Project.find(params[:project_id])
    @project.tasks.each do |t|
      if t.users.include?(@user)
	t.users=t.users-[@user]
      end
    end
    @project.users=@project.users-[@user]
    redirect_to @project
  end
  
  def search
    @user=User.search(params[:search])
    @project=Project.find(params[:project_id])
    if @user.blank?
    redirect_to @project, :flash => { :error => "No such a user!" }
    else
      if @project.users.include?(@user) || @project.hostid==@user.id
	redirect_to @project, :flash => { :error => "Already works!" }
      else
	@project.users=@project.users+[@user] 
	redirect_to @project
      end
    end
  end
end 