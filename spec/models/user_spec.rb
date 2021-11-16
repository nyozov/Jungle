require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new
    end
    
    it 'validates if all fields are present' do
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.email = 'test@gmail.com'
      @user.password = 'test'
      @user.password_confirmation = 'test'
      expect(@user.valid?).to be true
    end

    it 'invalid if passwords do not match' do
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.email = 'test@gmail.com'
      @user.password = 'test'
      @user.password_confirmation = 'test2'
      expect(@user.valid?).to be false
    end

    it 'invalid if email is taken' do
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.email = 'test@gmail.com'
      @user.password = 'test'
      @user.password_confirmation = 'test'
      @user.save

      @user2 = User.new
      @user2.first_name = 'test'
      @user2.last_name = 'test'
      @user2.email = 'test@gmail.com'
      @user2.password = 'test'
      @user2.password_confirmation = 'test'
      expect(@user2.valid?).to be false
    end

    it 'invalid if password length below minimum length' do
      @user.first_name = 'test'
      @user.last_name = 'test'
      @user.email = 'test@gmail.com'
      @user.password = 'te'
      @user.password_confirmation = 'te'
      expect(@user.valid?).to be false
    end



  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(
        first_name: 'asd',
        last_name: 'asd',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
      )
      @user.save
    end

    it 'validate if empty space before or after email' do
      emailwithspace = '  test@test.com  '
      usertest = User.authenticate_with_credentials(emailwithspace, @user.password)
      expect(usertest).to eq(@user)
      
    end

    it 'validate if email is in wrong case' do
      emailwithcase = 'TeSt@tEst.com'
      usertest = User.authenticate_with_credentials(emailwithcase, @user.password)
      expect(usertest).to eq(@user)

    end

  end

end