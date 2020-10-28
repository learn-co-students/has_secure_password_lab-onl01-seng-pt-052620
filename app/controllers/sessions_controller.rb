class SessionsController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])

        if user
            session[:user_id] = user.id
            redirect_to welcome_path
        else
            redirect_to new_user_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to login_path
    end
end
