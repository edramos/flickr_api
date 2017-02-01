const Flickr = React.createClass({
  props: {
    data: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  getInitialState: function () {
    return {
      images: this.props.data
    }
  },

  render: function () {
    // The first call to Flickr API gets the basic info for photos,
    // one is the 'src' and I just it in order to show the image in the ImageCard,
    // in this point some other info as Username is still empty,
    // but ImageCard will do the second FLickr API call to get more info about
    // the photo.
    // It improves the response-time while the end-user is seeing the images.
    let images = [];
    if (this.state.images.length != 0) {
      images = this.state.images.map((image, i) => {
        return (
            <Flickr.ImageCard key={i}
                              url={image.url}
                              id={image.id}
                              secret={image.secret}/>
        )
      });
    }else{
      images =
          <div className="text-center" style={{marginTop: 160, fontSize: 18}}>
            <p>Oops! There are no matches.<br/>Please try broadening your search.</p>
          </div>
    }

    return(
      <div>
        {images}
      </div>
    )
  }
});