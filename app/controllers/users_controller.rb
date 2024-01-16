class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(new_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: 'User created successfully!'
    else
      render :new
    end
  end

  private
  
  def new_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end