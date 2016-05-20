class SessionsController < ApplicationController
  
  def new
  end

  def create
  	borrower = Borrower.find_by(email: params[:email])
  	lender = Lender.find_by(email: params[:email])
  	if 
  		borrower && borrower.authenticate(params[:password])
  		session[:borrower_id] = borrower.id
  		redirect_to "/online_lending/borrower/#{borrower.id}"
  	elsif
  		lender && lender.authenticate(params[:password])
  		session[:lender_id] = lender.id
  		redirect_to "/online_lending//lender/#{lender.id}"
  	else
  		flash[:errors] = ["Invalid password/email combination"]
  		redirect_to :back 
  	end
  end

  def destroy
  	session[:user_id] = nil
  	current_user = nil
  	redirect_to '/'
  end


end
