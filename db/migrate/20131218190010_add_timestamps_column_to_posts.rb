class AddTimestampsColumnToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
  end

  def down
    remove_column :posts, :created_at, :datetime
    remove_column :posts, :updated_at, :datetime
  end
end
