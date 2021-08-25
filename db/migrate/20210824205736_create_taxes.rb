class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.integer :rate
      t.string :name

      t.timestamps
    end
  end
end
