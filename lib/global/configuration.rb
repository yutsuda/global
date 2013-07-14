require "forwardable"

module Global
  class Configuration
    extend ::Forwardable

    attr_reader :hash

    def_delegators :hash, :to_hash, :key?, :[], :[]=, :inspect


    def initialize(hash)
      @hash = hash.respond_to?(:with_indifferent_access) ? hash.with_indifferent_access : hash
    end

    protected

    def method_missing(method, *args, &block)
      @hash.key?(method) ? @hash[method] : super
    end
  end
end