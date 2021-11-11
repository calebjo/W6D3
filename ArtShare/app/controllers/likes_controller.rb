class LikesController < ApplicationController

    def create
        debugger
        like = Like.new(like_params)
        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @likes = Like.find(params[:id])
        @likes.destroy
        render json: @likes
    end

    private
    def like_params
        params.require(:like).permit(:likeable_id, :likeable_type, :user_id)
    end

end