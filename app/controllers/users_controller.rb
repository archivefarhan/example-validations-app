class UsersController < ApplicationController
  def create
    user = User.new(first_name: params["first_name"], last_name: params["last_name"], email: params["email"])
    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    id = params["id"]
    user = User.find(id)

    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.email = params["email"] || user.email

    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
