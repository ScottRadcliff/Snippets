require './code_formatter.rb'
require 'rspec'
require 'rack/test'

describe 'Snippet App' do 
  it "formats text as HTML" do
    html = CodeFormatter.display("something")
    pp html.include? "hello"
    pp html
    html.include? "something"
  end
end
