require "spec_helper"

describe 'Snippet App' do 

  it "description" do
    get '/' 
    last_response.should be_ok
  end

  it "creates a new snippet" do
    post '/create', {:title => "New Snippet", :code => "this is new"}
    last_response.header['location'] == 'http://example.org/'
  end

end
