class CreateGifs < ActiveRecord::Migration
  def change
    create_table :gifs do |t|
      t.text :url, :null => false

      t.timestamps
    end
  end
end
