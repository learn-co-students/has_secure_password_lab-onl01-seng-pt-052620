class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id
            render :welcome
        else
            flash[:notice] = "Name and password cannot be blank"
            redirect_to new_user_path
        end 
    end 

    def welcome
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
