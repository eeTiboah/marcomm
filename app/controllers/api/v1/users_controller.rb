class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    p user
    p params
    if user.save 
      render json: {name: user.name, message: "welcome"}
    else 
      render json: {errors: user.errors}
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
