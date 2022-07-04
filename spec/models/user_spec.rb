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
    it "can login with white spaces in email" do
      @user = User.create(first_name: "first", last_name: "last",email: "test@test.com", password:"pass123", password_confirmation:"pass123")

      expect(User.authenticate_with_credentials(" test@test.com   ", "pass123")).to eq(@user)
    end

    it "can login with not case sensitive email" do
      @user = User.create(first_name: "first", last_name: "last", email: "test@test.com", password:"pass123", password_confirmation:"pass123")

      expect(User.authenticate_with_credentials("teSt@TEST.com", "pass123")).to eq(@user)
    end

    it "can login with correct credentials" do
      @user = User.new(first_name: "first", last_name: "last", email: "test@test.com", password: "pass123", password_confirmation: "pass123")
      @user.save
      expect(User.authenticate_with_credentials("test@test.com", "pass123")).to be_truthy
    end

  end
end
