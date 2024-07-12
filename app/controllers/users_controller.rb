class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @post_images = @user.post_images   # 個人が投稿したもの全てを表示できる。@user.post_images⇨ ユーザーが投稿した投稿画像を全て取得し@post_imagesに渡す
  end

  def edit
   @user = User.find(params[:id])
  end
  
  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to user_path
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end
