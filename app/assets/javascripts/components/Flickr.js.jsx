const Flickr = React.createClass({
  props: {
    data: React.PropTypes.arrayOf(React.PropTypes.object).isRequired
  },

  render: function(){
    return (
        <p>FLICKR REACTJS</p>
    )
  }
});