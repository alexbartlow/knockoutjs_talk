require "rubygems"
require "bundler/setup"
require 'rack'
require 'sinatra'
require 'coffee-script'
require 'slim'

set :slim, :layout_engine => :erb, :layout => :layout

get '/' do
  erb :index
end

get '/:path' do
  erb params[:path].to_sym rescue slim params[:path].to_sym
end

get '/coffeescripts/:path' do
  coffee params[:path].to_sym
end



