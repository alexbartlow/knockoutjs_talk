require "rubygems"
require "bundler/setup"
require 'rack'
require 'sinatra'
require 'coffee-script'

get '/' do
  erb :index
end

get '/coffeescripts/:path' do
  coffee params[:path].to_sym
end



