class CreateInternshipsEntities < ActiveRecord::Migration
  def change
    create_table :internships_entities do |t|
      t.integer :entity_id
      t.string :name
      t.string :description
      t.boolean :available

      t.timestamps
    end
  end
end
