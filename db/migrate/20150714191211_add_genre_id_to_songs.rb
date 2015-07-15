class AddGenreIdToSongs < ActiveRecord::Migration
  def self.up
    add_column :songs, :genre_id, :integer
    add_index  :songs, :genre_id, unique: true
  end

  def self.down
    remove_index  :songs, :genre_id
    remove_column :songs, :genre_id
  end
end
