# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    job { Faker::Job.title }
  end
end