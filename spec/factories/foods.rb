require 'faker'

FactoryBot.define do
  factory :food do
    id { Faker::Number.digit }
    name { Faker::Name.name }
    description { Faker::Quote.famous_last_words }
    price { Faker::Number.number(digits: 10) }
  end
end
