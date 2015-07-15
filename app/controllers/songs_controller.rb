def new
    @artist = get_artist
    @album = get_album(@artist)
    @song = @album.songs.new
  end

  def create
    @artist = get_artist
    @album = get_album(@artist)
    @song = @album.songs.new(song_params)
    @song.artist = @artist
    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
    @artist = get_artist
    @album = get_album(@artist)
    @song = @album.songs.find(params[:id])
  end

  def update
    @artist = get_artist
    @album = get_album(@artist)
    @song = @album.songs.find(params[:id])
    if @song.update_attributes(song_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
    @artist = get_artist
    @album = get_album(@artist)
    @song = @album.songs.find(params[:id])
    @song.destroy
    redirect_to artist_path(@artist)
  end

  private

  def get_artist
    Artist.find(params[:artist_id])
  end

  def get_album(artist)
    artist.albums.find(params[:album_id])
  end

  def song_params
    params.require(:song).permit(:title)
  end

end