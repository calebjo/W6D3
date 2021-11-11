class CommentsController < ApplicationController

    def index
        debugger
        if params[:user_id] && params[:artwork_id]
            @comments = Comment.select('*').joins(:artwork).where("artworks.id = #{params[:artwork_id]}")
            @artworks = Comment.select('*').joins(:author).where("user.id = #{params[:user_id]}")
            render json: (@artworks + @comments)

        elsif params[:user_id]
            @comments = Comment.select('*').joins(:author).where()
            render json: @comments
        elsif params[:artwork_id]

            @comments = Comment.select('*').joins(:artwork).where("artworks.id = #{params[:artwork_id]}")
            render json: @comments
        end
    end
    
    def create
        comment = ArtworkShare.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comments.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end

end