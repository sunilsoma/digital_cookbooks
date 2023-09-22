class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name, limit: 100, null: false
      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
