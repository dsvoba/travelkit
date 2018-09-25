import React from "react"
import PropTypes from "prop-types"
class OrdersIndexList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      orders: []
    };
  }

  componentDidMount(){
    fetch('/api/v1/orders.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ orders: data }) });
  }

  render () {
    var orders = this.state.orders.map((order) => {
      return(
        <div className={this.props.order_id == order.id ? 'item current' : 'item'} key={order.id}>
          <div className="id">#{order.id}</div>
          <div className={"status " + order.status}><span>{order.status}</span></div>
          <div className="description">{order.description}</div>
          <div className="total">{order.total}</div>
          <div className="created_at">{order.created_at}</div>
        </div>
      )
    })
    return(
      <div className="list orders">
        <div className="item tablehead">
          <div className="id">Order</div>
          <div className="status">Status</div>
          <div className="description">Product</div>
          <div className="total">Total</div>
          <div className="created_at">Date</div>
        </div>
        {orders}
      </div>
    )
  }
}
export default OrdersIndexList
