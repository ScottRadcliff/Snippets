configure :development do
  conn = Mongo::Connection.new
  ENV['db'] = conn['snippets']
end
