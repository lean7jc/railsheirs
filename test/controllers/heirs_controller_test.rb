require "test_helper"

class HeirsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heir = heirs(:one)
  end

  test "should get index" do
    get heirs_url
    assert_response :success
  end

  test "should get new" do
    get new_heir_url
    assert_response :success
  end

  test "should create heir" do
    assert_difference('Heir.count') do
      post heirs_url, params: { heir: { email: @heir.email, facebook: @heir.facebook, first_name: @heir.first_name, last_name: @heir.last_name, phone_number: @heir.phone_number } }
    end

    assert_redirected_to heir_url(Heir.last)
  end

  test "should show heir" do
    get heir_url(@heir)
    assert_response :success
  end

  test "should get edit" do
    get edit_heir_url(@heir)
    assert_response :success
  end

  test "should update heir" do
    patch heir_url(@heir), params: { heir: { email: @heir.email, facebook: @heir.facebook, first_name: @heir.first_name, last_name: @heir.last_name, phone_number: @heir.phone_number } }
    assert_redirected_to heir_url(@heir)
  end

  test "should destroy heir" do
    assert_difference('Heir.count', -1) do
      delete heir_url(@heir)
    end

    assert_redirected_to heirs_url
  end
end
