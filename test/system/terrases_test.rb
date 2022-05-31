require "application_system_test_case"

class TerrasesTest < ApplicationSystemTestCase
  setup do
    @terrase = terrases(:one)
  end

  test "visiting the index" do
    visit terrases_url
    assert_selector "h1", text: "Terrases"
  end

  test "creating a Terrase" do
    visit terrases_url
    click_on "New Terrase"

    fill_in "Address", with: @terrase.address
    fill_in "Name", with: @terrase.name
    click_on "Create Terrase"

    assert_text "Terrase was successfully created"
    click_on "Back"
  end

  test "updating a Terrase" do
    visit terrases_url
    click_on "Edit", match: :first

    fill_in "Address", with: @terrase.address
    fill_in "Name", with: @terrase.name
    click_on "Update Terrase"

    assert_text "Terrase was successfully updated"
    click_on "Back"
  end

  test "destroying a Terrase" do
    visit terrases_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Terrase was successfully destroyed"
  end
end
