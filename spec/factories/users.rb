# frozen_string_literal: true

FactoryBot.define do
  sequence :inn, &:to_s

  factory :user do
    first_name 'John'
    last_name  'Doe'
    inn { generate(:inn) }
  end
end
