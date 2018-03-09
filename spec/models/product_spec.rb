require 'rails_helper'

describe Product do

let(:product) { Product.create!(name: "basil seeds") }
let(:user) { User.create!(email: "test@test.com", password: "testtest") }

before do
  product.comments.create!(rating: 1, user: user, body: "Awful!")
  product.comments.create!(rating: 3, user: user, body: "Ok bike!")
  product.comments.create!(rating: 5, user: user, body: "Great bike!")
end

it "returns the average rating of all comments" do
  expect(product.average_rating).to eq 3
end

it "is not valid without a name" do
  expect(Product.new(description: "Works fine!")).not_to be_valid
end

end
