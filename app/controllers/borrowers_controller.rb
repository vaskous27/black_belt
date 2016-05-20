class BorrowersController < ApplicationController
    before_action :require_login_borrower, only: [:destroy, :show]
   # before_action :require_correct_borrower, only: [:create, :destroy, :edit, :update]
  def new
  end

  def create
  	borrower = Borrower.new(borrower_params)

    if borrower.save
      redirect_to :root
    else
      flash[:errors] = user.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @show_borrower = Borrower.find(params[:id])
    @lenders = Transaction.find_by(borrower_id: params[:id]).lender.first_name
    @lenders_last = Transaction.find_by(borrower_id: params[:id]).lender.last_name
    @lenders_email = Transaction.find_by(borrower_id: params[:id]).lender.email

  end

   private
   def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :desc, :money, :need_money, :amount_needed )
   end
end
