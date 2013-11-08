require './environment.rb'
require 'sidekiq/web'

run Rack::URLMap.new('/' => Sinatra::Application, '/sidekiq' => Sidekiq::Web)