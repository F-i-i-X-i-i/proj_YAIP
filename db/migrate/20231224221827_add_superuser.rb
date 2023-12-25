class AddSuperuser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :superuser, :boolean
  end
end
