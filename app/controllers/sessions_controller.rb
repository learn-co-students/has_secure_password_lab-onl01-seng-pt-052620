class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:user][:password])
    return redirect_to login_path unless authenticated
    session[:user_id] = @user.id
    @user = user
    redirect_to root_path
  end

  # def create
  #   if params[:name].nil?
  #     redirect_to login_path
  #   elsif params[:name].empty?
  #     redirect_to login_path
  #   else
  #     session[:name] = params[:name]
  #     redirect_to '/'  
  # end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end


end
