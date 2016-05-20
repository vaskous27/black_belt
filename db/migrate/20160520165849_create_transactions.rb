class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :lender, index: true
      t.references :borrower, index: true

      t.timestamps
    end
  end
end
