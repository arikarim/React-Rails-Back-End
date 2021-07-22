# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server

# require 'rack/cors'
# use Rack::Cors do
#   allow do
#     origins '*'

#     resource '*', headers: %w(Authorization),
#                   methods: :any,
#                   expose: %w[Authorization]
#   end
# end
