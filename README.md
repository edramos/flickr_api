# EduFlickr

A Ruby on Rails Web App using the Flickr API.

<a href="https://eduflickr.herokuapp.com/" target="_blank">DEMO</a>
## Features
The Flickr API has a method which allows you to search photos, 
* Users can see in the Index page the recent photos uploaded to Flickr.
* Performs search for photos.
* You can visit the author's profile or the image page. 

## Installation
* bundle install
* rails db:create
* rails db:migrate
* For Acceptance Test it needs PhantomJS >= 2.0 <a href="https://gist.github.com/telbiyski/ec56a92d7114b8631c906c18064ce620">Install PhantomJS 2.1.1 Ubuntu</a>

## UAT Scenarios
* User goes to Index page and see some photos
* User performs a search
* User performs a search without match
* User clicks on a search result

## Tech Stack

* Ruby 2.3.1
* Ruby on Rails 5.0.1
* RSpec, Capybara, Poltergesit, Fuubar
* Bootstrap, React-Rails
* FlickRaw

