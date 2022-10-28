FactoryBot.define do
  factory :item do
    name          { 'test' }
    introduction  { '紹介文' }
    category_id   { 2 }
    situation_id  { 2 }
    cost_id       { 2 }
    area_id       { 2 }
    send_day_id   { 2 }
    price         { 12345 }
    association :user

  end
end
