require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "go to register page" do
  	get '/register'
  	assert_response :success
  end
  test "go to sign in page" do
  	get '/signin'
  	assert_response :success
  end
  test "redirect when user logout" do
  	get '/signout'
  	assert_response :redirect
  	assert_redirected_to '/'
  end
  test "when profile name given goto show page from profile controller" do
  	get '/praveenkumar'
  	assert_response :success
  end
end
