require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './config/environments' #database configuration

require File.expand_path("../application", __FILE__)