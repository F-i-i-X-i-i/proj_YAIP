class AddIsActive < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_active, :boolean
  end
end
