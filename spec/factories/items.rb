FactoryBot.define do
  factory :item do
    item_name        { Faker::Commerce.product_name }
    description      { Faker::Lorem.sentence }
    price            { 300 }

    category_id      { 2 }
    condition_id     { 2 }
    shipping_fee_id  { 2 }
    prefecture_id    { 2 }
    shipping_day_id  { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open(Rails.root.join('spec/fixtures/test_image.png')),
        filename: 'test_image.png',
        content_type: 'image/png'
      )
    end
    # ActiveStorageへデータを渡す処理、AI任せ
  end
end
