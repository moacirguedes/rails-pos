class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :description
      t.boolean :was_bought
      t.references :profile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
