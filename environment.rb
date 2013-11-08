require 'sinatra'
require 'twitter'
require 'mongoid'
require 'sidekiq'
require 'omniauth'
require 'omniauth-twitter'
require 'redis'
require 'kiqstand'

[:production, :development, :test].each { |e| configure(e) { require_relative "./config/environments/#{ e.to_s }.rb" }}

enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'IjXIRmNN149u0J7jveDAIrvwj'

Dir["config/initialize/**/*.rb"].each {|file| require_relative file }
Dir["app/**/*.rb"].each {|file| require_relative file }

Mongoid.load!( "config/mongoid.yml" )

$log.info "#{ Time.now } #{ ENV["RACK_ENV"] } environment loaded"