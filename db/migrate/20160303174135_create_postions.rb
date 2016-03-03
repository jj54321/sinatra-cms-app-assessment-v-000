class CreatePostions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :status
      t.string :instrument
      t.integer :user_id
    end
  end
end
