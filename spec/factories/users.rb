FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'abc123' }
    password_confirmation { password }
    first_name { '太郎' }
    last_name { '田中' }
    first_name_katakana { 'タロウ' }
    last_name_katakana { 'タナカ' }
    birth_date { Faker::Date.birthday }
  end
end
