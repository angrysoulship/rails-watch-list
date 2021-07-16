class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[ show edit update destroy ]
  # def index
  #   @bookmarks = bookmark.all
  # end

  # def show
  #   @movies = Movie.all
  # end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id] )
    @bookmark.list = @list
    @bookmark.movie = @movie
    @bookmark.save
    redirect_to list_path(@list)
  end
  
  def edit
    
  end

  def update

  end

  def destroy
    @list = List.find(@bookmark.list_id)
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :moive_id)
  end

end