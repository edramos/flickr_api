require 'rails_helper'

RSpec.feature 'Flickr API Management' do

  scenario 'User goes to Index page and see some photos', js: true do
    visit root_path
    expect(current_path).to eq('/')
    # Expect to see the Search Text Input
    expect(page).to have_xpath("//input[@placeholder='Photos, people, or groups']")
    # Expect to see photos from the flickr.photos.getRecent
    expect(page).to have_xpath("//img[contains(@alt,'API')]", :between => 1..20)
    # Save a screenshot of page
    save_screenshot
  end

  scenario 'User performs a search', js: true do
    visit root_path
    expect(current_path).to eq('/')
    # Fill the Search Text Input with the word 'Peru'
    fill_in('q', :with => 'Peru')
    # Search for the submit button with icon and click on it
    page.find('.glyphicon.glyphicon-search').click
    # Expect go to the Search page
    expect(current_path).to eq('/pages/search')
    # Expect to see photos from the search result
    expect(page).to have_xpath("//img[contains(@alt,'API')]", :between => 1..20)
    # Save a screenshot of page
    save_screenshot
  end

  scenario 'User performs a search without match', js: true do
    # Go to the Search page with a search without matches
    visit 'pages/search?q=dfadsfsafsdfasfsdfsadfafsfasfffasdfasd'
    # Expect there is no matches
    expect(page).to_not have_xpath("//img[contains(@alt,'API')]")
    # Expect to see the no matches message
    expect(page).to have_content('Oops! There are no matches.')
    # Save a screenshot of page
    save_screenshot
  end

  scenario 'User clicks on a search result', js: true do
    # Go to the Search page with a search with matches
    visit 'pages/search?q=Peru'
    # Expect to see photos from the search result
    expect(page).to have_xpath("//img[contains(@alt,'API')]", :between => 1..20)
    # Click in the first search result (photo) and open it in a new tab
    new_photo_window = window_opened_by { first("img[alt='API']").click }
    # In the new tab
    within_window new_photo_window do
      # Search for the link 'You'
      # It depends on the UIX from Flickr,
      # so if it changes we need to update this
      find('a', :text => 'Explore')
      # Save a screenshot of page
      save_screenshot
    end
  end

 end
