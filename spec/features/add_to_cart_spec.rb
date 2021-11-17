require 'rails_helper'

RSpec.feature "AddToCart", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "User can click on add to cart and cart will increase by one" do
    visit root_path
   
    
    click_on "Add"


    expect(page).to have_content('My Cart (1)')
   
    
  end
end