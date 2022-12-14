FactoryBot.define do
  factory :item do
    name          { 'test' }
    introduction  { '紹介文' }
    category_id   { 2 }
    situation_id  { 2 }
    cost_id       { 2 }
    area_id       { 2 }
    send_day_id   { 2 }
    price         { 12_345 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
