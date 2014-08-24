get '/' do
  puts "============================="
  AdminUser.first().to_json
end