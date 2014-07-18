require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotes)
  end

  test "should redirect to sigin in page if not logged in" do
    get :new  
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test 'If user logged in should create new quote' do
    sign_in users(:praveen)
    get :new
    assert_response :success
  end

  test "should redirected to sigin page if not logged in" do
    post :create, quote: {content: "hello",user_id:1}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create quote if logged in" do
    sign_in users(:praveen)
    assert_difference('Quote.count') do
      post :create, quote: { content: @quote.content, user_id: @quote.user_id }
    end

    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should show quote " do
    get :show, id: @quote
    assert_response :success
  end

  test 'should redirected to signin if not logged in' do
    get :edit, id: @quote
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should get edit if user logged_in" do
    sign_in users(:praveen)
    get :edit, id: @quote
    assert_response :success
  end

  test "should  redirected to signin page quote if logged in" do
    put :update, id: @quote, quote: { content: @quote.content, user_id: @quote.user_id }
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should update quote if logged in" do
    sign_in users(:praveen)
    put :update, id: @quote, quote: { content: @quote.content, user_id: @quote.user_id }
    assert_redirected_to quote_path(assigns(:quote))
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete :destroy, id: @quote
    end

    assert_redirected_to quotes_path
  end
end
