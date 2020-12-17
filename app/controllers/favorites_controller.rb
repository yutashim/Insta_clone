class FavoritesController < ApplicationController
  def create
    current_user.favorites.create(post_id: params[:id])
    redirect_to post_path(params[:id])
  end

  def destroy
    current_user.favorites.find_by(post_id: params[:id]).destroy
    redirect_to post_path(params[:id])
  end
end
