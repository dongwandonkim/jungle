require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "validates if it contains all attributes" do
      @category = Category.new(name: "car")
      @product = @category.products.new
      @product.name = "bmw"
      @product.price = 100
      @product.quantity = 10
      @product.save

      expect(@product).to be_valid
    end

  it "is invalid without name" do
    @category = Category.new(name: "car")
    @product = @category.products.new
    @product.price = 100
    @product.quantity = 10
    @product.save
    @product.name = nil

    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eql(["Name can't be blank"])
  end

  it "is invalid without price" do
    @category = Category.new(name: "car")
    @product = @category.products.new
    @product.name = "bmw"
    @product.quantity = 10
    @product.save

    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
  end

    it "is invalid without quantity" do
      @category = Category.new(name: "car")
      @product = @category.products.new
      @product.name = "bmw"
      @product.price = 100
      @product.quantity = nil
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql(["Quantity can't be blank"])
    end

    it "is invalid without category" do
      @category = nil
      @product = Product.new
      @product.name = "bmw"
      @product.price = 100
      @product.quantity = 10
      @product.save

      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to eql(["Category must exist", "Category can't be blank"])
    end

  end
end
