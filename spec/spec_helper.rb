ENV['RACK_ENV'] = 'test'
require './snippet_app.rb'
require './code_formatter.rb'
require 'rspec'
require 'rack/test'

include Rack::Test::Methods

Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false


# Initialize the app
def app
 SnippetApp
end

RSpec.configure do |config|
  # reset database before each example is run
  config.before(:each) do
    conn = Mongo::Connection.new
    conn['test_snippets']['snippet'].remove()
  end
end 
