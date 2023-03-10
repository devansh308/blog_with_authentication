class LoginsController < ApplicationController
  def new
    user = User.find_by(id: session[:user_id])
    redirect_to dashboards_path if user
    @user = User.new
  end

  def create
    @user = User.find_by(user_params)
    if @user
      session[:user_id] = @user.id
      redirect_to dashboards_path
    else
      flash[:alert] = "Unable to Login!"
      render :new, status: :unprocessable_entity
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
