require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
#require "sinatra/json"

require "sinatra/jsonp"

require "easy_translate"

require File.expand_path("../application", __FILE__)

EasyTranslate.api_key ="AIzaSyCPrhaatVk0EvxxsVu0XfduD8vRuOYZ00Q"

