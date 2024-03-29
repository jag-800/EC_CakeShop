class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  has_one_attached :item_image
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  def get_item_image(width, height)
    unless item_image.attached?
      file_path = Rails.root.join('app/assets/images/shortcake.png')
      item_image.attach(io: File.open(file_path), filename: 'shortcake.png', content_type: 'image/jpeg')
    end
    # item_image.variant(resize_to_limit: [width, height]).processed
    #上のコードだと元ん画像のサイズより大きくできない
    item_image.variant(resize: "#{width}x#{height}!").processed
  end
  
  def with_tax_price
    (price * 1.1).ceil
    # ceilは切り上げ、floorが切り捨て、roundが四捨五入
  end
  
end
