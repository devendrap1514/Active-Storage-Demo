class UsersController < ApplicationController
  protect_from_forgery

  def index
    user = User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }
    end
  end

  def show
    user = User.find_by_id(params[:id])
    if user
      render json: url_for(user.profile_picture)
    else
      render json: nil, status: :not_found
    end
  end

  def update
    user = User.find_by_id(params[:id])
    if user
      user.profile_picture.attach(user_params[:profile_picture])
      render json: url_for(user.profile_picture)
    else
      render json: nil, status: :not_found
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user
      user.destroy
      render json: nil
    else
      render json: nil, status: :not_found
    end
  end

  def see_profile
    @user = User.find_by_id(params[:id])
  end

  private
    def user_params
      params.permit(:profile_picture)
    end
end
