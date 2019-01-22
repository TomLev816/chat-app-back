class AddNameAndIsPrivateToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :name, :string
    add_column :rooms, :isPrivate, :boolean
  end
end
