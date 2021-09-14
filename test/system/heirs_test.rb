require "application_system_test_case"

class HeirsTest < ApplicationSystemTestCase
  setup do
    @heir = heirs(:one)
  end

  test "visiting the index" do
    visit heirs_url
    assert_selector "h1", text: "Heirs"
  end

  test "creating a Heir" do
    visit heirs_url
    click_on "New Heir"

    fill_in "Email", with: @heir.email
    fill_in "Facebook", with: @heir.facebook
    fill_in "First name", with: @heir.first_name
    fill_in "Last name", with: @heir.last_name
    fill_in "Phone number", with: @heir.phone_number
    click_on "Create Heir"

    assert_text "Heir was successfully created"
    click_on "Back"
  end

  test "updating a Heir" do
    visit heirs_url
    click_on "Edit", match: :first

    fill_in "Email", with: @heir.email
    fill_in "Facebook", with: @heir.facebook
    fill_in "First name", with: @heir.first_name
    fill_in "Last name", with: @heir.last_name
    fill_in "Phone number", with: @heir.phone_number
    click_on "Update Heir"

    assert_text "Heir was successfully updated"
    click_on "Back"
  end

  test "destroying a Heir" do
    visit heirs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heir was successfully destroyed"
  end
end
