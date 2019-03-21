module Spree
  class CheckoutController < Spree::StoreController
  	def update
  	  redirect_to midtrans_charge_url(payment_method_id: Spree::Gateway::MidtransGateway.first.try(:id)) if Spree::Gateway::MidtransGateway.first.present? && @order.state == "payment"
      super
    end  	
  end
end