require "spec_helper"
describe 'Snippet App' do 
  it "formats text as HTML" do
    html = CodeFormatter.display("something")
    html.include? "something"
  end
end
