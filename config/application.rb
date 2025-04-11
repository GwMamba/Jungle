require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module New
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Load Google Cloud API key from config file
    config.before_configuration do
      env_file = Rails.root.join("config", "google_cloud.yml")
      YAML.load(File.open(env_file))[Rails.env].each do |key, value|
        ENV[key.to_s] = value
      end if File.exist?(env_file)
    end  
    
    # Enable i18n
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :en

    # Set the locale from the user's language preference stored in session or cookie
    # config.before_configuration do
    #   I18n.locale = ENV['LANG'] || config.i18n.default_locale
    # end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end