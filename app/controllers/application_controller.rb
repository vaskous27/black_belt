class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_borrower
    Borrower.find(session[:borrower_id]) if session[:borrower_id]
  end
  helper_method :current_borrower

   def require_login_borrower
    redirect_to '/' if session[:borrower_id] == nil
  end

    def require_correct_borrower
    borrower = Borrower.find(params[:id])
    redirect_to "/" if current_borrower != borrower
  end

  def current_lender
    Lender.find(session[:lender_id]) if session[:lender_id]
  end
  helper_method :current_lender

   def require_login_lender
    redirect_to '/' if session[:lender_id] == nil
  end

    def require_correct_lender
    lender = Lender.find(params[:id])
    redirect_to "/" if current_lender != lender
  end


end
