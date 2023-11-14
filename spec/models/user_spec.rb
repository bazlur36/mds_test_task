require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is not valid without a first name" do
    user = build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a last name" do
    user = build(:user, last_name: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without email" do
    user = build(:user, email_id: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without valid email" do
    user = build(:user, email_id: "sssss")
    expect(user).to_not be_valid
  end

end
