class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def new
  end

  def show
    @user = User.find(params[:id])
    @secret = @user.secrets
  end

  def create
    @user = User.create( user_params )
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.update(params[:id], user_params)
    @user = User.find(params[:id])
    redirect_to "/users/#{@user.id}"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
