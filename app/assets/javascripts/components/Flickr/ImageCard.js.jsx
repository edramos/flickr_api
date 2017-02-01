Flickr.ImageCard = React.createClass({
  props: {
    url: React.PropTypes.string.isRequired,
    id: React.PropTypes.string.isRequired,
    secret: React.PropTypes.string.isRequired
  },

  getInitialState: function () {
    // Current values used, but we can add more,
    // more info: https://www.flickr.com/services/api/flickr.photos.getInfo.html
    return {
      title: '',
      username: '',
      url_photostream: '',
      url_photopage: ''
    }
  },

  componentDidMount: function () {
    this._getPhotoInfo(this.props.id, this.props.secret);
  },

  _getPhotoInfo: function (id, secret) {
    // This is the second call to the Flick API photos_get_info,
    // here the component gets the username, links, descriptions and so on
    $.ajax({
      url: '/pages/photos_get_info',
      method:'GET',
      data: {id: id, secret: secret},
      success: function(info){
        this.setState({...info});
      }.bind(this)
    });
  },

  render: function () {
    return(
      <div className="col-xs-4">
        <div className="panel panel-default">
          <div className="panel-body">
            <a href={this.state.url_photostream}>
              <p>{this.state.username}</p>
            </a>
            <a href={this.state.url_photopage} target="_blank">
              <img src={this.props.url} width={'100%'} alt="API"/>
            </a>
            <p>{this.state.title}</p>
          </div>
        </div>
      </div>
    )
  }
});