class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
