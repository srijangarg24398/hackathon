class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.references :customer, index: true, foreign_key: true
      t.datetime :date
      t.text :description
      t.string :food_amount
      t.string :location

      t.timestamps null: false
    end
  end
end
