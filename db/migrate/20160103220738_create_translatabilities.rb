class CreateTranslatabilities < ActiveRecord::Migration
  def change
    create_table :translatabilities do |t|
      t.belongs_to :phrase, index: true, foreign_key: true
      t.belongs_to :translation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
