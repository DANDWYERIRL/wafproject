require 'test_helper'

class BlanksControllerTest < ActionController::TestCase
  setup do
    @blank = blanks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blanks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blank" do
    assert_difference('Blank.count') do
      post :create, blank: { notneeded: @blank.notneeded }
    end

    assert_redirected_to blank_path(assigns(:blank))
  end

  test "should show blank" do
    get :show, id: @blank
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blank
    assert_response :success
  end

  test "should update blank" do
    put :update, id: @blank, blank: { notneeded: @blank.notneeded }
    assert_redirected_to blank_path(assigns(:blank))
  end

  test "should destroy blank" do
    assert_difference('Blank.count', -1) do
      delete :destroy, id: @blank
    end

    assert_redirected_to blanks_path
  end
end
