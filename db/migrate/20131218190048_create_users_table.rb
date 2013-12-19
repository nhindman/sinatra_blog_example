class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users do |t|

      t.string    :first_name
      t.string    :last_name
      t.string    :username
      t.text      :bio


      t.timestamps
      # t.datetime  :created_at
      # t.datetime  :updated_at

    end
  end

  def down
  end
end
