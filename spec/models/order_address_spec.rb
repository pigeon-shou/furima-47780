require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '入力内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば保存ができること' do
        expect(@order_address).to be_valid
      end
      it '建物名が空でも登録できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'postal_codeが「3桁ハイフン4桁」の並びだと保存できること' do
        @order_address.postal_code = '123-4567'
        expect(@order_address).to be_valid
      end

      it 'phone_numberが10桁で保存できること' do
        @order_address.phone_number = '1234567890'
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁で保存できること' do
        @order_address.phone_number = '12345678901'
        expect(@order_address).to be_valid
      end
    end
    context '入力内容に問題がある場合' do
      it 'postal_codeが空だと保存ができないこと' do
        @order_address.postal_code = ''
        @order_address.invalid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが1だと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture 都道府県を選択してください')
      end
      it 'tokenが空では登録できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Token クレジットカード情報を入力してください')
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeにハイフンを含まないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code (３ケタの数字)-(4ケタの数字)で入力してください')
      end
      it 'postal_codeが全角だと保存できないこと' do
        @order_address.postal_code = '１２３−４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code (３ケタの数字)-(4ケタの数字)で入力してください')
      end

      it 'postal_codeが「3桁ハイフン4桁」の並びでないと保存できないこと' do
        @order_address.postal_code = '12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code (３ケタの数字)-(4ケタの数字)で入力してください')
      end
      it 'phone_numberがハイフンを含むと登録できないこと' do
        @order_address.phone_number = '012-3456-789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number ハイフンを含めず10桁または11桁で入力してください')
      end
      it 'phone_numberが9桁では登録できないこと' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number ハイフンを含めず10桁または11桁で入力してください')
      end
      it 'phone_numberが12桁では登録できないこと' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number ハイフンを含めず10桁または11桁で入力してください')
      end
      it 'phone_numberが全角数字では登録できないこと' do
        @order_address.phone_number = '０１２３４５６７８９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number ハイフンを含めず10桁または11桁で入力してください')
      end
    end
  end
end
