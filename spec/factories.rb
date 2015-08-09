require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do
  factory :post do
    name { Faker::Name.name }
    body { Faker::Lorem.paragraph }
  end

  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password "foobarfoobar"
    password_confirmation { |u| u.password }
  end
end
