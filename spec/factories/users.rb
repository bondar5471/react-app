FactoryBot.define do
  sequence :inn do |n|
    n.to_s
  end

  factory :user do
    first_name "John"
    last_name  "Doe"
    inn { generate(:inn) }
  end
end