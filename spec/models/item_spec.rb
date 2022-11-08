require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報' do
    context '出品できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像: を入力してください")
      end
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名: を入力してください")
      end
      it 'introductionが空では登録できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明: を入力してください")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリー: を選択してください")
      end
      it 'situationが未選択だと出品できない' do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態: を選択してください")
      end
      it 'costが未選択だと出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担: を選択してください")
      end
      it 'areaが未選択だと出品できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域: を選択してください")
      end
      it 'send_dayが未選択だと出品できない' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数: を選択してください")
      end
      it 'priceが9999999以上なら登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格: は9999999以下の値にしてください")
      end
      it 'priceが299以下なら登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格: は300以上の値にしてください")
      end
      it 'priceが半角数値以外なら登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格: は数値で入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User: を入力してください")
      end
    end
  end
end
