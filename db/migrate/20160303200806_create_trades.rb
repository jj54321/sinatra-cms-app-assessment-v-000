class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.decimal :entry
      t.decimal :exit
      t.decimal :profit_loss
      t.integer :position_id
    end
  end
end
