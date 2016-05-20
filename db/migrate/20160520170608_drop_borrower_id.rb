class DropBorrowerId < ActiveRecord::Migration
  def change
  	remove_column(:borrowers, :lender_id)
  end
end
