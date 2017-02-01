require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #index' do
    context 'when Index page is found' do
      it 'responds with 200' do
      end

      it 'shows the Index page' do
      end
    end

    context 'when Index page is not found' do
      it 'responds with 404' do
      end
    end
  end


  describe 'GET #search' do
    context 'when Search page is found' do
      it 'responds with 200' do
      end

      it 'shows the Index page' do
      end
    end
  end


  describe 'GET AJAX #photos_get_info' do
    context 'when Photo Info from Flickr API is found' do
      it 'returns http success' do
      end

      it 'returns a JSON' do
      end

      it 'does not return a HTML' do
      end
    end
  end

end
