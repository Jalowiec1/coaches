class UsersController < ApplicationController
  include SessionsHelper
  def index
    @users = User.all
  end
  def add_coach(coach_id)
    Coaching.new(:student_id => current_user.id, :coach_id => coach_id)
  end
  def show
    @user = User.find(params[:id])
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
