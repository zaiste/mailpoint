require 'rubygems'
require 'bundler'
require 'rack/env'

Bundler.require

require './app.rb'

App.use Rack::Throttle::Interval, min: 1.0
App.use Rack::Throttle::Daily, max: 2000
App.use Rack::Env

App.run server: :Thin
