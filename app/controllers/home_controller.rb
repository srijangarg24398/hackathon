class HomeController < ApplicationController
  # before_action :authenticate_customer!
  def index
  	# byebug
  	if customer_signed_in?
  		return redirect_to '/customers/index'
  	end
  	if retailer_signed_in?
  		return redirect_to '/retailers/index'
  	end
  	if manufacturer_signed_in?
  		return redirect_to '/manufacturers/index'
  	end
  	if restaurant_signed_in?
  		return redirect_to '/restaurants/index'
  	end
  end
end
