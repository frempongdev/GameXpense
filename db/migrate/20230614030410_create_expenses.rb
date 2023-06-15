class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.text :name
      t.decimal :amount
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
