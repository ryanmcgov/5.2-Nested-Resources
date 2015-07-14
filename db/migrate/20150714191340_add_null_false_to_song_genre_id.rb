class AddNullFalseToSongGenreId < ActiveRecord::Migration
  def change
    change_column :songs, :genre_id, :integer, null: false
  end
end
