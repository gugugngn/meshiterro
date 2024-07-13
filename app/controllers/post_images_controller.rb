class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end
  
  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)  # フォームに入力されたデータ(shop_name や caption,image など)が、@post_image に格納。post_image_params` メソッドで、 `params` オブジェクトから必要な属性をセット。そのためにはストロングパラメータとして定義が必要。
    @post_image.user_id = current_user.id   #投稿データに、今ログイン中のユーザーの ID を持たせている
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end


 private

 def post_image_params   # フォームで入力されたデータが、投稿データとして許可されているパラメータかどうかをチェック
  params.require(:post_image).permit(:shop_name, :image, :caption)     # postimageモデルを指定し、データを絞り込み⇨保存するカラムを指定。脆弱性を防いでいるらしい。
 end

end