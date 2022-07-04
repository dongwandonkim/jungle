require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do

    it "is not valid if pw and pw confirmation do not match" do
      @user = User.create(first_name: "tester", last_name: "last", email: "test@test.com", password: "pass123", password_confirmation: "123pass")

      expect(@user).to_not be_valid
    end

    it "is not valid if email is not unique" do
      @user = User.create(first_name: "first", last_name: "last", email: "test@test.com", password: "pass123", password_confirmation: "pass123")
      @user2 = User.create(first_name: "first", last_name: "last", email: "TEST@TEST.com", password: "pass123", password_confirmation: "pass123")

      expect(@user).to be_valid
      expect(@user2).to_not be_valid
    end

    it "not valid without email, first name and last name" do
      @user = User.create(first_name: "first", last_name: "last", password: "pass123", password_confirmation: "pass123")
      @user2 = User.create(last_name: "last", email: "test@test.com",  password: "pass123", password_confirmation: "pass123")
      @user3 = User.create(first_name: "first", email: "test@test.com", password: "pass123", password_confirmation: "pass123")

      expect(@user).to_not be_valid
      expect(@user2).to_not be_valid
      expect(@user3).to_not be_valid
    end

    it "is not valid if password length shorter than 6 characters" do
      @user = User.new(first_name: "first", last_name: "last", password: "1", password_confirmation: "1")

      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
