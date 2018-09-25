# README
Demo ecommerce app that is using coingate payments api.

To start application do the following in your terminal:
cd travelkit
rake db:create db:migrate db:seed
export COINGATE_AUTH_TOKEN=your_coingate_api_token
rails s