class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(post_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to new_user_path
        end
    end

    def show
        redirect_to login_path unless !!:current_user
    end

    private

    def post_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end