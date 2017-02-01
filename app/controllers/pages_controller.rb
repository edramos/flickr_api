require 'flickraw'

class PagesController < ApplicationController
  before_action :flickr_auth

  # GET root /
  def index
    # Get the recent photos uploaded to Flickr
    # result.count is 100 items
    result = flickr.photos.getRecent
    @images = set_list(result)
  end

  def search
  end


  private

  # Prepare the objects from Flickr API
  # i.e. item: {"id":"31805571794","owner":"104484899@N08","secret":"7d8a70f6fb","server":"518","farm":1,
  # "title":"","ispublic":1,"isfriend":0,"isfamily":0}
  #
  def set_list(list)
    images = []
    # It only takes the first 20 items for test
    list.first(20).each do |item|
      # puts item.to_json
      obj = {
          id: item.id,
          secret: item.secret,
          url: "https://farm#{item.farm}.staticflickr.com/#{item.server}/#{item.id}_#{item.secret}.jpg"
      }
      images.push(obj)
    end
    images
  end

  # Flickr API Authentication using FlickRaw
  def flickr_auth
    # Just for fast testing it will be public,
    # in production it will be hidden in ENV VARS
    #
    FlickRaw.api_key = '142c9f2ece1cadf0771cec9aca1740fe'
    FlickRaw.shared_secret = '12f66489ef933ebb'
  end
end
