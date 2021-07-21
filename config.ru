# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server

# require 'rack/cors'
# use Rack::Cors do
#   allow do
#     origins 'http://localhost:3000'
#       resource '*', headers: %w(Authorization),
#                     methods: :any,
#                     expose: %w(Authorization),
#                     credentials: true
#   end
# end
use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
            /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
            # regular expressions can be used here
            resource '*', headers: %w(Authorization),
                    methods: :any,
                    expose: %w(Authorization),
                    credentials: true
  end
end

