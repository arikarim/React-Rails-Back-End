# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
Rails.application.load_server

# require 'rack/cors'
# use Rack::Cors do
#   allow do
#     origins 'http://localhost:3000'
#     resource '*', headers: :any,
#                   methods: %i[get post delete put options],
#                   expose: %w[Authorization],
#                   credentials: true
#   end
# end
