require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cart" do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should show cart" do
    get :show, id: @cart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cart
    assert_response :success
  end

  test "should update cart" do
    patch :update, id: @cart, cart: {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test "should destroy cart" do
    assert_difference('Cart.count', -1) do
      session[:cart_id] = @cart.id
      delete :destroy, id: @cart
    end

    assert_redirected_to store_path
  end

  test "add unique products to cart" do
    cart = Cart.create
    bcd = products(:bcd)
    reg  = products(:regulator)
    cart.add_product(bcd.id).save!
    cart.add_product(reg.id).save!
    assert_equal 2, cart.line_items.size
    assert_equal bcd.price + reg.price, cart.total_price
  end

  test "add duplicate product to cart" do
    cart = Cart.create
    bcd = products(:bcd)
    cart.add_product(bcd.id).save!
    cart.add_product(bcd.id).save!
    assert_equal 2* bcd.price, cart.total_price
    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items[0].quantity
  end

end
