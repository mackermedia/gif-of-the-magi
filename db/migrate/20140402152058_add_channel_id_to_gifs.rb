class AddChannelIdToGifs < ActiveRecord::Migration
  def change
    add_column :gifs, :channel_id, :integer

    execute "UPDATE gifs SET channel_id = 1"

    change_column :gifs, :channel_id, :integer, :null => false
  end
end
