class CreateCommentsTable < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer   :user_id
      t.integer   :post_id
      t.text      :body
      
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
