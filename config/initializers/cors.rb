# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors
domain = 'example.com'

# These subdomains are not trusted and should not be allowed to authenticate with cookies
cors_third_party_subdomains = %w[
  blog
  shop
  support
].join('|')

# These are the Rack::Cors settings that we want to set, first for all domains and then for trusted ones
cors_headers = {
  resource: '*', headers: :any,
  methods: :any,
  expose: %w[Authorization],
  credentials: false
}
cors_headers_internal = cors_headers.merge({ credentials: true })

# This is the actual Rack::Cors configuration
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # Third party subdomains should not get cookies in case of XSS
  allow do
    origins %r{^https://(#{cors_third_party_subdomains})\.#{domain}$}
    resource '*', cors_headers
  end

  # We only want allow-credentials to be true for our own requests
  # Otherwise you'll need to supply or other non-cookie credentials
  allow do
    origins %r{^https://(|[^.]+\.)#{domain}$}
    resource '*', cors_headers_internal
  end

  # All other requests made over https allow CORS without credentials
  allow do
    origins %r{^https://}
    resource '*', cors_headers
  end

  # Allow connections from localhost on non-prod environments as internal requests
  unless Rails.env.production?
    allow do
      origins %r{^(https?://)?localhost(:\d+)?$}
      resource '*', cors_headers_internal
    end
  end
end

# Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true do
#   allow do
#     origins 'http://localhost:3000'

#     resource '*', headers: :any,
#                   methods: :any,
#                   expose: %w[Authorization],
#                   credentials: true
#   end
# end
