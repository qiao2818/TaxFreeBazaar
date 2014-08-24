get '/' do
  AdminUser.all.to_json
end