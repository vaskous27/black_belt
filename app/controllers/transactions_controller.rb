class TransactionsController < ApplicationController

	def create
		@borrower = Borrower.find(params[:borrower_id])
		@lender = Lender.find(current_lender.id)
		@lended_money = params[:money_given]

		@money = @lender.money.to_i
		@money -= params[:money_given].to_i
		
		 @lender.update(money: @money)
		 @borrower.update(money_raised: params[:money_given])

		 @transaction = Transaction.create(lender_id: current_lender.id, borrower_id: params[:borrower_id])

		 redirect_to :back

	end


end
