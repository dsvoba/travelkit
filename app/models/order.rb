class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  scope :recent, -> { order created_at: :desc }

  def subtotal
    total
  end

  def set_status(new_status)
    update_attribute(:status, new_status)
  end

  # https://developer.coingate.com/docs/order-statuses
  def update_status_by_coingate(coingate_status)
    update_attribute(:coingate_status, coingate_status)

    case coingate_status
      when 'paid'       then set_status('paid')
      when 'canceled'   then set_status('canceled')
      when 'expired'    then set_status('unpaid') # Or set as expired
      when 'confirming' then set_status('confirming') # Or set as processing or payment_processing
      when 'refunded'   then set_status('refunded')
      when 'invalid'    then set_status('invalid')
    end
  end

  def fetch_and_update_status
    cg_order = CoingateService.new.get_order(coingate_id)
    update_status_by_coingate(cg_order.response[:status])
  end

  def description
    products = []
    order_products.map { |order_product| products << [order_product.quantity, order_product.product.name].join(' × ') }
    
    products.join(', ')
  end
end
