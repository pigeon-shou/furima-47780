class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user

  validates :item_name, presence: true
  validates :description, presence: true
  validates :image, presence: { message: '画像を一枚送付してください' }

  with_options presence: true, numericality: { other_than: 1, message: 'を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :item_name, length: { maximum: 40 }
  validates :description, length: { maximum: 1000 }

  validates :price,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9_999_999, message: 'は半角数字で300円以上9,999,999円以下にしてください'
            }
end
