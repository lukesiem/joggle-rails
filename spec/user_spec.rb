require 'rails_helper'


RSpec.describe User, type: :model do 
	describe 'Validations' do

      it "is valid with valid attributes" do
        @user = User.new(
          first_name: "Your",last_name: "Hero", email: "squarejaw@heromail.com",
          password: "save4life",password_confirmation: "save4life")
        expect(@user).to be_valid
	 end

       it 'is not valid when first name is not included' do
        @user = User.new(first_name: nil,last_name: "Hero", email: "squarejaw@heromail.com",
          password: "save4life", password_confirmation: "save4life")
       expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Make Sure you have a first name")
   end


      it 'is not valid When last name is not included' do
        @user = User.new(first_name: 'Your',last_name: nil, email: "squarejaw@heromail.com",
          password: "save4life", password_confirmation: "save4life")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("put in your last name")
    end

     it 'is not valid When email is not included' do
       @user = User.new(first_name: 'Your', last_name: 'Hero',email: nil,
          password: "save4life", password_confirmation: "save4life")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("You need an email")
    end

      it 'is not valid When password is not included' do
        @user = User.new(first_name: 'Your', last_name: 'Hero', email: "squarejaw@heromail.com",
          password: nil, password_confirmation: "save4life")
      expect(@user).to_not be_valid
    end

    it 'is not valid When password confirmation is not included' do
      @user = User.new(first_name: 'Your', last_name: 'Hero', email: "squarejaw@heromail.com",
        password: "save4life", password_confirmation: nil )
      expect(@user).to_not be_valid
  end

  it 'is not valid When password length is not valid' do
      @user = User.new(first_name: 'Your', last_name: 'Hero', email: "squarejaw@heromail.com",
        password: "save", password_confirmation:"save" )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

   it 'is not valid When password confirmation and password are not equal' do
      @user = User.new(first_name: 'Your', last_name: 'Hero', email: "squarejaw@heromail.com",
        password: "save4life", password_confirmation: 'savelife' )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

   it 'is not valid email is not unique' do
      @user1 = User.new(first_name: 'Your',last_name: 'Hero', email: 'squarejaw@heromail.com',
        password: 'save4life', password_confirmation: 'save4life' )
      @user1.save
      @user2 = User.new(first_name: 'bob', last_name: 'Hero',email: 'SQUAREjaw@heromail.com',
        password: '1234567', password_confirmation: '1234567')
      
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to include("Email has already been used")
  
  end

     describe '.authenticate_with_credentials' do
       it 'when there are white spaces around the email address' do
        @user = User.new(first_name: 'Your',last_name: 'Hero', email: 'squarejaw@heromail.com  ',password: 'save4life',
          password_confirmation: 'save4life' )
      @user.save
      expect(User.authenticate_with_credentials('squarejaw@heromail.com  ',@user.password)).to be_truthy
     
    end

    it 'when there are different cases with the email' do
      @user = User.new(first_name: 'Your', last_name: 'Hero', email: 'squarejaw@heromail.com',
        password: 'save4life',  password_confirmation: 'save4life')
      @user.save
      expect(User.authenticate_with_credentials('SQuareJaw@heromail.com',@user.password)).to be_truthy
            

      end
   end
 end
end