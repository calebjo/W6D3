class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(params.require(:user).permit(:username))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
    end

    def destroy
    end

    def update
    end

    private
    # def params
    #     params.require(:user).permit(:username)
    # end

end