class AddAuthorMailToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :email, :string
  end
end
