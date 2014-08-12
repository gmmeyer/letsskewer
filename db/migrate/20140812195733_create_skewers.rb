class CreateSkewers < ActiveRecord::Migration
  def change
    create_table :skewers do |t|
      t.integer :user_id, null: false
      t.integer :posts_count

      t.timestamps
    end
    add_index :skewers, :user_id
  end
end
