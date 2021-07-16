class ListsController < ApplicationController
		before_action :set_list, only: %i[ show edit update destroy ]
    def index
      @lists = List.all
    end

    def show
      @movies = Movie.all
      @bookmarks = Bookmark.all
    end

    def new
			@list = List.new
    end

    def create
      @list = List.new(list_params)
      @list.save
      redirect_to lists_path 
    end
    
    def edit
      
    end

    def update

    end

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      redirect_to lists_path
    end

		private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :img_url)
    end

end
