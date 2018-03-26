require "sinatra"
require "socket"
require "mysql2"

set :bind, "0.0.0.0"

get "/" do
  @hostname = Socket.gethostname
  erb :index
end

get "/health" do
  random = rand(1...10)

  return status 500 if random < 4
  status 200
end

get "/database" do
  client = Mysql2::Client.new(host: "mysql", database: "pgk_development", username: ENV['DB_USER'], password: ENV['DB_PASSWORD'])
  results = client.query("SELECT * FROM users")
  "#{results.count} rows returned."
end