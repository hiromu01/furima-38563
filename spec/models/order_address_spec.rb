require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報登録' do
    before do
      item = FactoryBot.build(:item)
      user = FactoryBot.build(:user)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '購入できる場合' do
      it 'すべての情報が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名が存在しなくても登録できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeは、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order_address.post_code = 11_111_111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'areaが未選択だと保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Area must be other than 1')
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
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、半角数値のみ保存可能なこと' do
        @order_address.phone_number = 111 - 1111 - 1111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、9桁以下は保存できないこと' do
        @order_address.phone_number = 123_456_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberは、12桁以上は保存できないこと' do
        @order_address.phone_number = 123_456_789_123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
