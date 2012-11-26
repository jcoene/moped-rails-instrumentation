module Moped
  module Rails
    module Instrumentation
      autoload :Version, 'moped/rails/instrumentation/version'
      autoload :Railtie, 'moped/rails/instrumentation/railtie'
      autoload :LogSubscriber, 'moped/rails/instrumentation/log_subscriber'
      autoload :ControllerRuntime, 'moped/rails/instrumentation/controller_runtime'
    end
  end
end
