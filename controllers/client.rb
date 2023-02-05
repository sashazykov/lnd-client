# frozen_string_literal: true

require_relative '../components/grpc'
require_relative 'config'
require_relative 'service'

module LNDClientInternal
  class ClientController
    attr_reader :config, :doc

    def initialize(options)
      @config = LNDClientInternal::ConfigController.new(self, options)
      @services = {}

      doc = Struct.new(:services)
      @doc = doc.new(LNDClientInternal::GRPC::SERVICES.keys.map(&:to_s))
    end

    def respond_to_missing?(method_name, include_private = false)
      service_key = method_name.to_sym

      LNDClientInternal::GRPC::SERVICES.include?(service_key) || super
    end

    def method_missing(method_name, *args)
      service_key = method_name.to_sym

      unless LNDClientInternal::GRPC::SERVICES.include?(service_key)
        raise ArgumentError, "Method `#{method_name}` doesn't exist."
      end

      @services[service_key] ||= LNDClientInternal::ServiceController.new(
        self, LNDClientInternal::GRPC::SERVICES[service_key], *args
      )
    end
  end
end
