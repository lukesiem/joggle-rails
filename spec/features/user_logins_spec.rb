require 'rails_helper'

RSpec.feature "Visitor logs into their account", type: :feature, js: true do
	let(:email) { 'cowman@gmail.com' }
	let(:password) { '12345678' }

  # SETUP
  before :each do

   @user = User.create!(
   	first_name: 'Josh',
   	last_name: 'gosh',
   	email: email,
   	password: password,
   	password_confirmation: password
   	)
  end

	scenario "They click the login" do
    # ACT
    visit root_path

    
    click_link 'Login'
 	
 	fill_in 'email', with: email
    
    fill_in 'password', with: password


    click_button('Submit')
    # DEBUG
    sleep(5)
    save_screenshot

    #VERIFY
    expect(page).to have_content 'Signed in as cowman@gmail.com'
  end
end

