require 'faker'
require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password "foobarfoobar"
    password_confirmation { |u| u.password }
  end
end
