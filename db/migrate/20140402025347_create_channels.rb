class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name, :null => false

      t.timestamps
    end

    add_index :channels, :name, :unique => true
  end
end
