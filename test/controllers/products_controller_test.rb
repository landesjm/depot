require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:bcd)
    @update = {
      title:  'ScubaPro BCD',
      description: 'ScubaPro Knighthawk BCD',
      image_url:  'http://www.scubapro.com/media/66612/seahawk-black.jpg',
      price:  700.00
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .list_description', 3
    assert_select 'dd', 'LED 300'
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
