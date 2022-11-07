class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
   validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
   validates :city
   validates :address
   validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
   validates :token
   validates :user_id
   validates :item_id

   validates :area_id, numericality: { other_than: 1, messages: "can't be blank" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
