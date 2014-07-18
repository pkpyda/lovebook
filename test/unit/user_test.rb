require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'user should enter first_name' do
  	user = User.new()
  	assert !user.save
  	assert !user.errors[:first_name].empty?
  end
  test 'user should enter last_name' do
  	user = User.new()
  	assert !user.save
  	assert !user.errors[:last_name].empty?
  end
  test 'user should enter profile_name' do
  	user = User.new()
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'user should enter  unique profile_name' do
  	user = User.new(first_name: "pk",last_name: "k",email:"p@gmail.com",password: "password",password_confirmation: "password")
  	user.profile_name = users(:praveen).profile_name
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test 'user profile_name should not contail spaces between the words' do
  	user = User.new(first_name: "pk",last_name: "k",email:"p@gmail.com",password: "password",password_confirmation: "password")
  	user.profile_name = "h a"
  	assert !user.save
  	assert !user.errors[:profile_name].include?("Must be in specified format")
  end
end
