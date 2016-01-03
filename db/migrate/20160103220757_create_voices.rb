class CreateVoices < ActiveRecord::Migration
  def change
    create_table :voices do |t|
      t.string :name
      t.belongs_to :phrase, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
