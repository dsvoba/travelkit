class PaymentsController < ApplicationController
  skip_before_action  :verify_authenticity_token, only: :notify
  before_action       :set_current_order, only: [:check, :success]
  before_action       :check_status_immediately, only: :success

  def notify
    id    = params[:order_id].split('-').last
    order = Order.find_by(id: id)
    
    order.fetch_and_update_status if order && order.token == params[:token]

    render nothing: true
  end

  def success
    
  end

  def check
    render json: @order
  end

  private

  def set_current_order
    @order = Order.find_by(id: session[:current_order])
  end

  def check_status_immediately
    @order.fetch_and_update_status

    redirect_to orders_path(order_id: @order.id) and return if @order.status != 'pending'
  end
end