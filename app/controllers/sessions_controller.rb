class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user == nil
      redirect_to 'new'
    else
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to welcome/new.html.erb
    end
  end

  def destroy
    if session[:name].present?
      session.delete :name
    end
    redirect_to :login
  end


end