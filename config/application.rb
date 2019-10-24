require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Todos
  class Application < Rails::Application
    config.middleware.insert_before 0, "Rack::Cors", :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*', headers: :any, methods: :any
      end
    end
  end
end
