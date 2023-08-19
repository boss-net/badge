# frozen_string_literal: true

require_relative 'boot'

# This loads all Rails libraries that are *present*. However,
# note that our Gemfile only includes the Rails gems we actually use
# (to reduce memory use and attack surface).
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BadgeApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end

Rails.application.configure do
  config.middleware.use Rack::Attack
  config.active_record.legacy_connection_handling = false
end
