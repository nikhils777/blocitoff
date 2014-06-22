require 'spec_helper'
feature 'Project manager creates TODO' do
  scenario 'Successfully' do
    @user1 = create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: 'douglas@example.com'
    fill_in 'Password', with: 'helloworld'
    click_button 'Log In'
    expect( page ).to have_content('Signed in') 
    visit root_path
    fill_in 'Enter a new TODO item!', with: 'Meet up with the team'
    click_button 'Add!'
    expect( page ).to have_content('Meet up with the team')
  end
end