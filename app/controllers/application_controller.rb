class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_default_settings

  private

  def set_default_settings
    session[:currency_rate]     ||= 1
    session[:currency]          ||= 'USD'
    session[:receive_currency]  ||= 'EUR'
  end

  def coingate_client
    CoingateService.new
  end

  def current_currency
    session[:currency]
  end
  helper_method :current_currency

  def current_currency_rate
    session[:currency_rate]
  end
  helper_method :current_currency_rate

  def current_receive_currency
    session[:receive_currency]
  end
  helper_method :current_receive_currency
end
