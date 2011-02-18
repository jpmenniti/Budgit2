class CreateDebits < ActiveRecord::Migration
  def self.up
    create_table :debits do |t|
      t.text :item_purchased
      t.integer :categoryID
      t.text :reason
      t.integer :nunber_of_consumers
      t.text :names_of_consumers
      t.integer :date_purchased
      t.integer :accountID
      t.integer :amount
      t.integer :reimbursement_date

      t.timestamps
    end
  end

  def self.down
    drop_table :debits
  end
end
