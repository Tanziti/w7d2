class UsersController < ApplicationController
  
  def new
   @user = User.new
  end

  def show 
    @user = User.find_by(params[name: :email])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
