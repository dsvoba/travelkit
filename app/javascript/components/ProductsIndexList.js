import React from "react"
import PropTypes from "prop-types"
class ProductsIndexList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount(){
    fetch('/api/v1/products.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ products: data }) });
  }

  render () {
    var csrfToken = document.querySelector('[name="csrf-token"]').content;
    var products = this.state.products.map((product) => {
      return(
        <div className="item" key={product.id}>
          <img src={product.image}/>
          <div className="name">{product.name}</div>
          <div className="description">{product.description}</div>
          <div className="price">{product.price}</div>
          <form action="/cart/checkout" method="post">
            <input type="hidden" name="authenticity_token" value={csrfToken}/>
            <input type="hidden" name="product[id]" value={product.id}/>
            <input type="submit" className="btn" value="Buy now"/>
          </form>
        </div>
      )
    })
    return(
      <div className="list products">
        {products}
      </div>
    )
  }
}
export default ProductsIndexList
