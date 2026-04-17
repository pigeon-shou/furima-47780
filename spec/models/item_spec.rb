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
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category を選択してください')
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition を選択してください')
      end
      it 'shipping_fee_idがからでは登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank", 'Shipping fee を選択してください')
      end
      it 'prefecture_idがからでは登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture を選択してください')
      end
      it 'shipping_day_idがからでは登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day を選択してください')
      end
    end
  end
end
