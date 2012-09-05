require './snippet_app.rb'
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class SnippetAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    SnippetApp
  end

  def test_index
    get '/'
    assert last_response.ok?
  end
end