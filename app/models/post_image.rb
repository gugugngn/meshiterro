class PostImage < ApplicationRecord# ここは投稿画像の管理用モデルの設定ファイル
  has_one_attached :image    #post_imageモデルにActiveStorageを使って画像を持たせている
  belongs_to :user

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
