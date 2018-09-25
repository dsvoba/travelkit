class Api::V1::OrdersController < ApplicationController
  def index
    collection = []
    orders = Order.recent.limit(100)
    orders.each do |o| 
      order = o.as_json
      order.merge!({"description" => o.description})
      order["created_at"] = o.created_at.strftime("%Y-%m-%d %H:%M")
      collection << order
    end
    render json: collection
  end
end