configure :development do |config|
  require "sinatra/reloader"
  config.also_reload "models/*.rb"
  config.also_reload "helpers/*.rb"
  config.also_reload "lib/*.rb"
  config.also_reload "lib/adaptor/*.rb"
  config.also_reload "models/community/*.rb"
end

%w{models controllers lib helpers mailer}.each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end