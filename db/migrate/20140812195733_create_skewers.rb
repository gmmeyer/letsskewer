class CreateSkewers < ActiveRecord::Migration
  def change
    create_table :skewers do |t|

      t.timestamps
    end
  end
end
