class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.integer :user_id
      
      t.integer, :skewer_id, null: false

      t.timestamps
    end
    add_index :posts, :skewer_id
    add_index :posts, :user_id
  end
end
