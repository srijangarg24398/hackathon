class CustomersController < ApplicationController
  	before_action :authenticate_customer!,except:[:notify]
 	def index
 		@restaurants=Restaurant.all
 	end
 	def notify
 		# byebug
 		@notification_message=params["message"]
 		notification_restaurant=params["restaurant"]
 		@notification_restaurant=Restaurant.find(notification_restaurant)
	    respond_to do |format|
	 		format.js{notice:"Food available at the lowest prices"}
	 	end
 	end
end