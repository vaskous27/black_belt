class AddColumn < ActiveRecord::Migration
  def change
  	add_column :borrowers, :money_raised, :integer
  end
end
