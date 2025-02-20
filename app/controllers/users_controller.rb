class UsersController < ApplicationController
    def welcome
        @user = session[:user_id]
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
        else
            redirect_to users_new_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
