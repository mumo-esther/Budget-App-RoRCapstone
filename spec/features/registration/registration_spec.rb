require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  it 'can enter a name and receive a greeting' do
    visit new_user_registration_path
    expect(page).to have_content 'Sign up'
  end

  it 'click the login error' do
    visit 'users/sign_up'
    click_button
    expect(page).to have_content "Email can't be blank"
  end

  it 'click the login error' do
    User.create(name: 'Ali Raza', email: 'hello@example.com', password: 'password')
    visit 'users/sign_up'
    fill_in 'email', with: 'user@example.com'
    fill_in 'new-pass', with: 'password'
    click_button
    expect(page).to have_content "Name can't be blank"
  end

  it 'click the login error' do
    visit 'users/sign_up'
    fill_in 'name', with: 'Ali Raza'
    fill_in 'email', with: 'ali@example.com'
    fill_in 'new-pass', with: 'password'
    click_button
    expect(page).to have_content 'Categories'
  end
end
