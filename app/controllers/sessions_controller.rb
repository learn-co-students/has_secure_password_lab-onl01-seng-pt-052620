class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(name: params[:name])
        user = user.try(:authenticate, params[:password])

        if user
            session[:user_id] = user.id
            redirect_to welcome_path
        else
            redirect_to new_user_path
        end
    end
end
