require 'spec_helper'
feature 'Project manager creates TODO' do
  scenario 'Successfully' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'nsharmaknox@gmail.com'
    fill_in 'Password', with: 'yahooooo'
    click_button 'Log In'
    expect( page ).to have_content('Signed in') 
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new TODO was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end