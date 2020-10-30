class SessionsController < ApplicationController

  def new

  end

  def create
    # binding.pry
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      redirect_to new_user_path 
    end
  end

  private
  
  def session_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end