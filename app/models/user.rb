class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true
  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+\z/
  validates :password,
            format: { with: VALID_PASSWORD_REGEX }, allow_blank: true,
            if: :password_required?

  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/

  with_options presence: true do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: VALID_NAME_REGEX }, allow_blank: true do
    validates :first_name
    validates :last_name
  end

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー]+\z/

  with_options presence: true do
    validates :first_name_katakana
    validates :last_name_katakana
  end

  with_options format: { with: VALID_KATAKANA_REGEX }, allow_blank: true do
    validates :first_name_katakana
    validates :last_name_katakana
  end
end
