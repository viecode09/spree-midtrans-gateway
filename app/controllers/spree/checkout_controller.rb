module Spree
  class CheckoutController < Spree::StoreController
    before_action :midtrans_redirection, only: [:update]
    
    private
  	def midtrans_redirection
  	  redirect_to midtrans_charge_url(payment_method_id: Spree::Gateway::MidtransGateway.first.try(:id)) if Spree::Gateway::MidtransGateway.first.present? && params[:state] == "payment"
    end  	
  end
end