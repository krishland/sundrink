require "test_helper"

class TerrasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @terrase = terrases(:one)
  end

  test "should get index" do
    get terrases_url
    assert_response :success
  end

  test "should get new" do
    get new_terrase_url
    assert_response :success
  end

  test "should create terrase" do
    assert_difference('Terrase.count') do
      post terrases_url, params: { terrase: { address: @terrase.address, name: @terrase.name } }
    end

    assert_redirected_to terrase_url(Terrase.last)
  end

  test "should show terrase" do
    get terrase_url(@terrase)
    assert_response :success
  end

  test "should get edit" do
    get edit_terrase_url(@terrase)
    assert_response :success
  end

  test "should update terrase" do
    patch terrase_url(@terrase), params: { terrase: { address: @terrase.address, name: @terrase.name } }
    assert_redirected_to terrase_url(@terrase)
  end

  test "should destroy terrase" do
    assert_difference('Terrase.count', -1) do
      delete terrase_url(@terrase)
    end

    assert_redirected_to terrases_url
  end
end
