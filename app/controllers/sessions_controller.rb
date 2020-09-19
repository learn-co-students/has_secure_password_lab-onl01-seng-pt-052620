class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete :name if session[:name]
        redirect_to login_path
    end



    helper_method :current_user
end
