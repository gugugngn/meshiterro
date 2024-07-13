class FavoritesController < ApplicationController
  
  def create
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.new(post_image_id: post_image.id)  # 特定の投稿画像（post_image）をお気に入りに追加する。post_image_idのカラム（いいねされた投稿画像のID）にpost_image.idの値をセットしている
    favorite.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end
  
end
