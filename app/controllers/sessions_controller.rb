class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #log in the user and redirect to the user show page
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    flash[:success] = "You've been logged out. Hope to see you soon, #{current_user.name.split[0]}"
    session.delete(:user_id)
    redirect_to root_path
  end
  
end
