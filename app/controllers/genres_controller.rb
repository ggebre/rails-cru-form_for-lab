class GenresController < ApplicationController
    def index 
        @genres = Genre.all
    end
    def show 
        @genre = Genre.find(params[:id])
    end
    def create 
        @genre = Genre.create(params_genre(:name))
        redirect_to genre_path(@genre)
    end
    def edit 
        @genre = Genre.find(params[:id])
        
    end
    def update 
        @genre = Genre.find(params[:id])
        @genre.update(params_genre(:name))
        redirect_to genre_path(@genre)
    end
    def new 
        @genre = Genre.new
    end

    private 

    def params_genre(*args)
        params.require(:genre).permit(*args)
    end
end
