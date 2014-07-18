require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should  show if existent profile_name given" do
    get :show, id: users(:praveen).profile_name
    assert_response :success
  end

  test "should goto not found page if profile_name not exist in user db" do
  	get :show, id: 'does not exist'
  	assert_response :not_found
  end

  test "variables assigned to profile page" do
  	get :show, id: users(:praveen).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:quotes)
  end

  test 'all quotes from profile_name user' do
  	get :show, id: users(:praveen).profile_name
  	assigns(:quotes).each do |quote|
  		assert_equal users(:praveen),quote.user
  	end
  end

end
