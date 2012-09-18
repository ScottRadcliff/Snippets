require './snippet_app.rb'
require 'rspec'
require 'rack/test'

# set :environment, :test



describe 'Snippet App' do 
  include Rack::Test::Methods

  def app
    SnippetApp
  end

  it "description" do
    get '/' 
    last_response.should be_ok
  end

  # it "creates a new snippet" do
  #   post '/create', {:title => "New Snippet", :code => "this is new"}
  #   last_response.header['location'] == 'http://example.org/'
  # end
end
