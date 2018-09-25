class CartController < ApplicationController
  before_action :set_product

  def checkout
    order = Order.create(
      total:          @product.price,
      status:         'pending',
      currency:       current_currency,
      currency_rate:  current_currency_rate,
      token:          SecureRandom.urlsafe_base64
    )

    order.order_products.create(product_id: @product.id, quantity: 1, price: (@product.price * order.currency_rate).round(CoingateService::CRYPTO_CURRENCIES.include?(order.currency) ? 6 : 2))

    session[:current_order] = order.id

    response = coingate_client.create_order(
      order_id:             "ORDER-#{(Time.now.to_f * 1e6).to_i}-#{order.id}",
      price_amount:         order.total,
      price_currency:       order.currency,
      receive_currency:     current_receive_currency,
      title:                "Order ##{order.id}",
      description:          order.description,
      callback_url:         payments_notify_url(token: order.token),
      success_url:          payments_success_url,
      cancel_url:           root_url,
      success_auto_return:  1
    )

    if response.success?
      order.update_attributes(coingate_id: response.response[:id], coingate_status: response.response[:status])

      redirect_to response.response[:payment_url]
    else
      order.update_attribute(:status, 'failure')
      order.order_failures.create(http_status: response.http_code, reason: response.reason, message: response.response)

      redirect_to order_path(order.id), flash: { error: 'Ooops! Something wrong. Please try again or contact with support' }
    end
  end

  private

    def set_product
      @product = Product.find(params[:product][:id])
    end
end
