# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name { 'John' }
    last_name { 'Doe' }
    email_id { 'john.doe@example.com' }
  end
end
