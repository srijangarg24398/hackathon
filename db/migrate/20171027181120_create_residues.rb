class CreateResidues < ActiveRecord::Migration
  def change
    create_table :residues do |t|
      t.references :restaurant, index: true, foreign_key: true
      t.datetime :date
      t.text :description
      t.float :discount

      t.timestamps null: false
    end
  end
end
