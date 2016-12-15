class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :require_correct_user, only: [:destroy]
  def create
    Like.create(user: current_user, secret_id: params[:secret_id])
    redirect_to '/secrets'
  end

  def destroy
    @like = Like.find_by user_id: params[:id], secret_id: params[:secret_id]
    @like.destroy
    redirect_to '/secrets'
  end
end
