class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def authenticate_user
    if current_user.nil?
      flash[:notice] = 'ログインしてください'
      redirect_to new_session_path
    end
  end

  def has_authority_to_edit_user?
    unless current_user&.id == params[:id]
      redirect_to posts_path
    end
  end

  def has_authority_to_edit_post?
    unless @post.user_id == current_user.id
      redirect_to posts_path
    end
  end

end
