require 'rails_helper'

describe User do

  before do
    User.create!(email: "test@test.com", password: "testtest")
  end

  it "creates valid user information" do
    expect(User.new(email: "test@test.com", password: "testtest"))
  end

  it "fails to input valid e-mail address" do
    expect(User.new(email: "testtest.com", password: "testtest")).not_to be_valid
  end

end
