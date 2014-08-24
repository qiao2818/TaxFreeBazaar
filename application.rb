configure :development, :production do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
  config.also_reload "helpers/*.rb"
  config.also_reload "lib/*.rb"
end

%w{models controllers lib helpers}.each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end

# initialize ActiveRecord
require 'active_record'
ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[ENV["RACK_ENV"]]