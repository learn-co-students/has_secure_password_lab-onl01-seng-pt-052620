class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:name])
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id
            render '/users/welcome'
        else
            render :new
        end
    end

end
