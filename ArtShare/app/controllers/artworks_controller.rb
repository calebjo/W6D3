class ArtworksController < ApplicationController

    def index
        debugger
        @my_artwork = Artwork.select('*').joins(:artist).where("users.id = #{params[:user_id]}")
        @viewed_artworks = Artwork.select('*').joins(:shared_viewers).where("users.id = #{params[:user_id]}")
        render json: (@my_artwork + @viewed_artworks)
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artworks = Artwork.find(params[:id])
        render json: @artworks
    end

    def destroy
        @artworks = Artwork.find(params[:id])
        @artworks.destroy
        redirect_to action: "index"
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to action: "show"
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end