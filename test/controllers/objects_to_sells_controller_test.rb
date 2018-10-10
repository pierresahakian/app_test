require 'test_helper'

class ObjectsToSellsControllerTest < ActionController::TestCase
  setup do
    @objects_to_sell = objects_to_sells(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:objects_to_sells)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create objects_to_sell" do
    assert_difference('ObjectsToSell.count') do
      post :create, objects_to_sell: { description: @objects_to_sell.description, image: @objects_to_sell.image, name: @objects_to_sell.name, price: @objects_to_sell.price }
    end

    assert_redirected_to objects_to_sell_path(assigns(:objects_to_sell))
  end

  test "should show objects_to_sell" do
    get :show, id: @objects_to_sell
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @objects_to_sell
    assert_response :success
  end

  test "should update objects_to_sell" do
    patch :update, id: @objects_to_sell, objects_to_sell: { description: @objects_to_sell.description, image: @objects_to_sell.image, name: @objects_to_sell.name, price: @objects_to_sell.price }
    assert_redirected_to objects_to_sell_path(assigns(:objects_to_sell))
  end

  test "should destroy objects_to_sell" do
    assert_difference('ObjectsToSell.count', -1) do
      delete :destroy, id: @objects_to_sell
    end

    assert_redirected_to objects_to_sells_path
  end
end
