require 'rails_helper'


RSpec.describe Product, type: :model do 
	describe 'Validations' do
	 before(:each) do
     @category = Category.new(name: 'Fruit')
     end
   

		it "is valid if it has all attributes" do
       @product = Product.new(name: 'Watermelon', price: 200, quantity: 30, category: @category)
       expect(@product.valid?).to be true
       end


       it "is not valid without a valid name" do
       @product = Product.new( price: 50, quantity: 2, category:@category)
       expect(@product.valid?).to be false
       end

       it "is not valid without a price" do
       @product = Product.new( name: 'Watermelon', quantity: 2, category: @category)
       expect(@product.valid?).to be false
       end

       it "is not valid without a quantity" do
       @product = Product.new( name: 'Watermelon', price: 200, quantity: nil, category: @category)
       expect(@product.valid?).to be false
       end

       it "is not valid without a category" do
       @product = Product.new( name: 'Watermelon', price: 200, quantity: 40, category: nil)
       expect(@product.valid?).to be false
       end


	

	end
	
end