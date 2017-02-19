require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Oauthapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_mailer.default_url_options = { host: Rails.application.secrets.app_host }

    config.action_mailer.smtp_settings = {
        address: 'smtp.gmail.com',
        port: '587',
        user_name: Rails.application.secrets.sender_email,
        password: Rails.application.secrets.sender_password
    }
  end
end
