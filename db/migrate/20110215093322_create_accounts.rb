class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.date :date
      t.integer :club_id
	  t.boolean :active
	  
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
