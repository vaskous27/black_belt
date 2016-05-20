class CreateBorrowers < ActiveRecord::Migration
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :need_money
      t.text :desc
      t.integer :amount_needed
      t.references :lender, index: true

      t.timestamps
    end
  end
end
