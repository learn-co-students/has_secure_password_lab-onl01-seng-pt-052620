class UsersController < ApplicationController
  def new
  end
  
  def create
    user = User.create(user_params)

    if user.password != user.password_confirmation 
      redirect_to '/users/new'
    else  
      session[:user_id] = user.id
    end 
  end

  def welcome
    @user = User.find_by(name: session[:name])
  end

  private

  def user_params 
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
