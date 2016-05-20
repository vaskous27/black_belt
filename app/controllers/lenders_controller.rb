class LendersController < ApplicationController
    before_action :require_login_lender, only: [:create, :destroy, :edit, :update]
   # before_action :require_correct_lender, only: [:create, :destroy, :edit, :update]

  def new
  end

  def create
  	lender = Lender.new(lender_params)

    if lender.save
      redirect_to :root
    else
      flash[:errors] = lender.errors.full_messages
     redirect_to :back
    end
  end

  def show
      @show_lender = Lender.find(params[:id])
      @borrowers = Borrower.all
      @debtors = Transaction.find_by(lender_id: params[:id]).borrower 

  end

  private
   def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
   end
end
