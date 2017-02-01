require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #index' do
    context 'when Index page is found' do
      it 'responds with 200' do
        get :index
        expect(response).to have_http_status(200)
      end

      it 'shows the Index page' do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'when Index page is not found' do
      controller do
        def index
          render :plain => 'index_wrong', :status => :not_found
        end
      end

      it 'responds with 404' do
        get :index
        expect(response).to have_http_status(404)
      end
    end
  end


  describe 'GET #search' do
    context 'when Search page is found' do
      it 'responds with 200' do
        get :search, params: {q: 'Peru'}
        expect(response).to have_http_status(200)
      end

      it 'shows the Search page' do
        get :search, params: {q: 'Australia'}
        expect(response).to render_template(:search)
      end
    end
  end


  describe 'GET AJAX #photos_get_info' do
    context 'when Photo Info from Flickr API is found' do
      # Real values for id and secret from Flickr API
      before(:each) do
        @id = '31795472214'
        @secret = 'c8e5ab591c'
      end

      it 'returns http success' do
        get :photos_get_info, params: {id: @id, secret: @secret}
        expect(response).to have_http_status(:success)
      end

      it 'returns a JSON' do
        get :photos_get_info, params: {id: @id, secret: @secret}
        expect(response.content_type).to eq 'application/json'
      end

      it 'does not return a HTML' do
        get :photos_get_info, params: {id: @id, secret: @secret}
        expect(response.content_type).to_not eq 'text/html'
      end
    end
  end

end
