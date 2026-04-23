FactoryBot.define do
  factory :order_address do
    postal_code { '012-3456' }
    prefecture_id { 2 }
    city { '横浜市' }
    address { '1-1-1' }
    phone_number { '0123456789' }
    building { Faker::Address.secondary_address }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
