configure :development, :production do |config|
  config.also_reload "models/*.rb"
  config.also_reload "helpers/*.rb"
  config.also_reload "lib/*.rb"
  config.also_reload "config/*.rb"
  config.also_reload "controllers/*.rb"
  config.also_reload "public/*.rb"
  config.also_reload "views/*.rb"
end

%w{models controllers lib helpers}.each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end

ActiveRecord::Base.establish_connection YAML::load(File.open('config/database.yml'))[ENV["RACK_ENV"]]