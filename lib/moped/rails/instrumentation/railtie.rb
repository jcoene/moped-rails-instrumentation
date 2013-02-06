require 'moped/rails/instrumentation'

module Moped::Rails::Instrumentation
  class Railtie < Rails::Railtie
    initializer "moped.rails.instrumentation" do |app|
      instrument Moped::Connection, [
        :read,
        :write
      ]

      ActiveSupport.on_load(:action_controller) do
        include ControllerRuntime
      end

      LogSubscriber.attach_to :moped
    end

    def instrument(clazz, methods)
      clazz.module_eval do
        methods.each do |m|
          class_eval <<-CODE, __FILE__, __LINE__ + 1
            def #{m}_with_instrumentation(*args, &block)
              ActiveSupport::Notifications.instrumenter.instrument "mongo.moped", :name => "#{m}" do
                #{m}_without_instrumentation(*args, &block)
              end
            end
          CODE

          alias_method_chain m, :instrumentation
        end
      end
    end
  end
end
