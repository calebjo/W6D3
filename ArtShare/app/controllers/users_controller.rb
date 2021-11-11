class UsersController < ApplicationController

    def index
        if params[:username]
            @user = 
            User
                .select('*')
                .where("LOWER(username) LIKE '%#{params[:username].downcase}%'")
            render json: @user
        else
            @users = User.all
            render json: @users
        end
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @users = User.find(params[:id])
        render json: @users
    end

    def destroy
        @users = User.find(params[:id])
        @users.destroy
        redirect_to action: "index"
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to action: "show"
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end