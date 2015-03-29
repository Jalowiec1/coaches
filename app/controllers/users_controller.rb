class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    debugger
  end
  def activate_coach
  @user = User.find(params[:id])
  @user.update_attribute(:if_coach, true)
  redirect_to @user
  end
  def no_longer_coach
  @user = User.find(params[:id])
  @user.update_attribute(:if_coach, false)
  redirect_to @user
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      log_in(@user)
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
