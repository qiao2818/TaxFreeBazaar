class CreateTranslates < ActiveRecord::Migration
  def change
    create_table :translates do |t|
      t.integer :apartment_id
      t.string :locale
      t.text :result
      t.timestamps
    end
  end
end
