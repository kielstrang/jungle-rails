require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid if email, name, and password are specified' do
      @user = User.new(email: 'test@test.com', name: 'Test McTest', password: 'password', password_confirmation: 'password')
      expect(@user.save).to be_truthy
    end

    it 'is invalid if email is not specified' do
      @user = User.new(name: 'Test McTest', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'is invalid if name is not specified' do
      @user = User.new(email: 'test@test.com', password: 'password', password_confirmation: 'password')
      @user.save
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'is invalid if password is not specified' do
      @user = User.new(email: 'test@test.com', name: 'Test McTest')
      @user.save
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "is invalid if password confirmation doesn't match" do
      @user = User.new(email: 'test@test.com', name: 'Test McTest', password: 'password', password_confirmation: 'fail_password')
      @user.save
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'is invalid if password is < 8 characters' do
      @user = User.new(email: 'test@test.com', name: 'Test McTest', password: '7_chars', password_confirmation: '7_chars')
      @user.save
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"
    end

    it 'is invalid if email is a duplicate (non-case-sensitive)' do
      @user = User.new(email: 'TEST@test.com', name: 'Test McTest', password: 'password', password_confirmation: 'password')
      @user.save
      @user2 = User.new(email: 'test@test.com', name: 'Test McTest', password: 'password', password_confirmation: 'password')
      @user2.save
      expect(@user2.errors.full_messages).to include "Email has already been taken"
    end
  end
end
