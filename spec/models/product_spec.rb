require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    @category = Category.new(name: 'category')
    @category.save!

    it 'is valid if name, price, quantity, and category are specified' do
      @product = Product.new(name: 'product', price: 123, quantity: 123, category_id: 1)
      expect(@product.save!).to be_truthy
    end

    it 'is invalid if name not specified' do
      @product = Product.new(name: nil, price: 123, quantity: 123, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'is invalid if price not specified' do
      @product = Product.new(name: 'product', price: nil, quantity: 123, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'is invalid if quantity not specified' do
      @product = Product.new(name: 'product', price: 123, quantity: nil, category_id: 1)
      @product.save
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'is invalid if category not specified' do
      @product = Product.new(name: 'product', price: 123, quantity: 123, category_id: nil)
      @product.save
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
