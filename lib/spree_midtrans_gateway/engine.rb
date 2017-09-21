module SpreeMidtransGateway
  class Engine < Rails::Engine
    require "spree/core"
    isolate_namespace Spree
    engine_name "spree_midtrans_gateway"

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "spree.midtrans_gateway.payment_methods", after: "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::MidtransGateway
    end
  end
end
