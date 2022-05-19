class Api::V1::AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      render json: {"message": "welcome #{user.name}"}
    else
      render json: {error: user.errors}
    end
  end
end