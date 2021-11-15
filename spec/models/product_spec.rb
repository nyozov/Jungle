require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new
      @category = Category.new
    end

    it 'will save with all fields' do
      @product.name = 'nametest'
      @category.name = 'categorytest'
      @product.price = 45
      @product.quantity = 1
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it 'validates name' do
      @product.name = nil
      @product.valid?
      expect(@product.errors[:name]).to include ("can't be blank")

    end
    
    it 'validates price' do
      @product.price = nil
      @product.valid?
      expect(@product.errors[:price]).to include ("can't be blank")
    end

    it 'validates quantity' do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include ("can't be blank")
    end

    it 'validates category' do
      @product.category = nil
      @product.valid?
      expect(@product.errors[:quantity]).to include ("can't be blank")
    end
  end

end
