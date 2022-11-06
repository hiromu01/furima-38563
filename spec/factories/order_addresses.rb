FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '111-1111' }
    area_id { 2 }
    city { '旭川' }
    address { 'アドレス' }
    building_name { '建物' }
    phone_number { '12312345678' }
  end
end
