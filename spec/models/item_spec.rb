require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品新規登録' do
    context '商品登録できる場合' do
      it '必要な情報がすべて揃っていれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300円以上9,999,999円以下であれば登録できる' do
        @item.price = 500
        expect(@item).to be_valid
      end
      it 'item_nameが40文字以下なら登録できる' do
        @item.item_name = 'a' * 40
        expect(@item).to be_valid
      end
      it 'descriptionが1000文字以下なら登録できる' do
        @item.description = 'a' * 1000
        expect(@item).to be_valid
      end
    end
    context '商品登録できない場合' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下にしてください')
      end
      it 'priceが300円未満では登録できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下にしてください')
      end
      it 'priceが9,999,999円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price は半角数字で300円以上9,999,999円以下にしてください')
      end
      it 'category_idが1のままでは登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end
      it 'condition_idが1のままでは登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition を選択してください')
      end
      it 'shipping_fee_idが1のままでは登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee を選択してください')
      end
      it 'prefecture_idが1のままでは登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end
      it 'shipping_day_idが1のままでは登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day を選択してください')
      end
      it 'imageが送付されてないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 画像を一枚送付してください')
      end
      it 'userが紐づいてないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'item_nameが41文字以上では登録できない' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end
      it 'descriptionが1001文字以上では登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Description is too long (maximum is 1000 characters)')
      end
    end
  end
end
