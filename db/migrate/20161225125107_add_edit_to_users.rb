class AddEditToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :profile, :text
  end
end
