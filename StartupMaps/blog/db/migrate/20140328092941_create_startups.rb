class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.integerresources :entity_id
      t.integer :milestones
      t.string :needs
      t.boolean :online_Status
      t.boolean :launched_Status
	    t.string :joint_Ventures
  	  t.string :sector
	    t.integer :number_of_working_years

      t.timestamps
    end
  end
end
