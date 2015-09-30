class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def show
    if current_user
      @user = User.find(params[:id])
    else
      flash[:warning] = "You must be logged in to view profile pages"
      redirect_to login_path
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      flash[:success] = "Welcome to the Sample App!"
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation)
    end
  
end
