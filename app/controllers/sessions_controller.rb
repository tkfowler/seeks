class SessionsController < ApplicationController
  def new
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = ["Invalid"]
      redirect_to '/sessions/new'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end
end
