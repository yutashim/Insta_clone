class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'ログイン成功！'
      redirect_to users_path(user.id)
    else
      flash[:notice] = 'ログイン失敗！'
      redirect_to new_session_path
    end
  end


  def destroy
    session.delete(:user_id)
    redirect_to new_user_path flash[:notice] = 'ログアウト！'
  end
end
