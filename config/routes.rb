Rails.application.routes.draw do
  # --- PAGES

  root to: "home#index"
  get 'orders', to: "home#orders"

  # --- API
  
  namespace :api do 
    namespace :v1 do 
      resources :products, only: [:index]
      resources :orders, only: [:index]
    end 
  end 

  # --- PAYMENTS

  post  'cart/checkout'   => 'cart#checkout'

  post  'payments/notify'
  get   'payments/success'
  get   'payments/check'
end
