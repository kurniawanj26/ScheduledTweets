class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # DEBUG
    # render plain: params[:user]
    # render plain: "Thanks"

    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Succesfully created account"
    else
      # flash[:alert] = "Something was wrong"
      # render new.html.erb
      render :new
    end
  end

  private

  def user_params
    # permit(:email, :password, :password_confirmation)
    # for security reason, only email,password and password confirmation allowed to set
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end