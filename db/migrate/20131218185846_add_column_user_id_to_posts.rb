class AddColumnUserIdToPosts < ActiveRecord::Migration
  def up
    # arguments:  table_name, column_name, data_type
    add_column :posts, :user_id, :integer
  end

  def down
    remove_column :posts, :user_id, :integer
  end
end
