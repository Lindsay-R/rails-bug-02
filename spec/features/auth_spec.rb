require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users can register' do

    visit root_path
    click_on "Register"
    fill_in "Name", with: "test"
    fill_in "Email", with: "test@test.com"
    fill_in "Password", with: "password"
    fill_in "Confirm", with: "password"
    click_on "Submit"
    save_and_open_page
    expect(page).to have_content("test@test.com")
  end

end
