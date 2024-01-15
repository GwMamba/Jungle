require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new(name: 'Example Category')
    end

    it 'should save successfully with all the valid attributes' do
      product = Product.new(
        name: 'Example Product',
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(product).to be_valid
      expect { product.save! }.not_to raise_error
    end
    
    it 'should not be valid without a name' do
      product = Product.new(
        price: 100,
        quantity: 10,
        category: @category
      )
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'should not be valid without a price' do
      product = Product.new(
        name: 'Example Product',
        price: 100,
        category: @category
      )
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not be valid without a quantity' do
      product = Product.new(
        name: 'Example Product',
        price: 100,
        category: @category
      )
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end

    it 'should not be valid without a category' do
      product = Product.new(
        name: 'Example Product',
        price: 100,
        quantity: 10
      )
      expect(product).not_to be_valid
      expect(product.errors[:category]).to include("can't be blank")
    end
  end
end
