require 'sinatra/base'
require 'sinatra/partial'
require 'mongo'
require 'rack-flash'
require './code_formatter.rb'

class SnippetApp < Sinatra::Base
 enable :sessions
 use Rack::Flash
 register Sinatra::Partial
 set :partial_template_engine, :erb

  before do
    conn = Mongo::Connection.new
    if ENV['RACK_ENV'] == 'test'
      @db = conn['test_snippets']
    else
      @db = conn['snippets']
    end
  end

  get '/' do
    @recent = @db['snippet'].find().sort({_id: -1}).limit(10)
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/create' do
    record = {title: params[:title], code: params[:code], language: params[:language]}
    @db['snippet'].save(record)
    flash[:notice] = "Snippet Saved"
    redirect "/"
  end

  get '/search' do
    @query = params[:snippets]
    @results = @db['snippet'].find( {title: /#{@query}/i} )
    erb :search
  end
  
end
