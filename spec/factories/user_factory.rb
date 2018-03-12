FactoryBot.define do
  factory :user do
    email "test@test.com"
    password "testtest"
    first_name "Testy"
    last_name "Testerson"
    admin false
  end
end
