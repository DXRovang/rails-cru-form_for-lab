class SongsController < ApplicationController
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
  end
  def create
   
    @artist = Artist.new(
      name: params[:song][:artist_id])
    @artist.save
    @genre = Genre.new(
      name: params[:song][:genre_id])
    @genre.save

    @song = Song.new(
      name: params[:song][:name],
       artist_id: @artist.id,
       genre_id: @genre.id
    )
    @song.save
    
    redirect_to song_path(@song)
  end
  def show
    @song = Song.find(params[:id])
    @genre = @song.genre_id
    @artist = @song.artist_id
  end
  def edit
    @song = Song.find(params[:id])
  end
  def update
    @song = Song.update(
      name: params[:song][:name],
      artist_id: params[:song][:artist_id],
      genre_id: params[:song][:genre_id]
    )
    redirect_to song_path(@song)
  end
end
