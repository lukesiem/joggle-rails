require 'rails_helper'

RSpec.feature "Visitor navigates to home page adds product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/SummerShirt_ydncke.jpg",
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    # ACT
    visit root_path
    first('.product').click_link('Add')

	#DEBUG /
	expect(page).to have_content('My Cart (1)')
	save_screenshot


end
end