class UsersController < ApplicationController
    def index
        # render plain: "HELLO"
        
        @users = User.all
        render json: @users
    end

    def create
        render json: params
    end

    def show
        render json: params
    end
end