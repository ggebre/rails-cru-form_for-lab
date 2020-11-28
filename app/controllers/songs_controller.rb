class SongsController < ApplicationController
    def index 
        @songs = Song.all
    end
    def show 
        @song = Song.find(params[:id])
    end
    def create 
        @song = Song.create(params_song(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
    def edit 
        @song = Song.find(params[:id])
        
    end
    def update 
        @song = Song.find(params[:id])
        @song.update(params_song(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end
    def new 
        @song = Song.new
    end

    private 

    def params_song(*args)
        params.require(:song).permit(*args)
    end
end
