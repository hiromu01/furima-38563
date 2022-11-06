class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  validates :post_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
  validates :token, presence: true

  validates :area_id, presence: true, numericality: { other_than: 1, messages: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name,
                   phone_number: phone_number, order_id: order.id)
  end
end
