require 'sinatra/base'
require 'mongo'
require 'rack-flash'

class App < Sinatra::Base
 enable :sessions
 use Rack::Flash

 before do
  conn = Mongo::Connection.new
  @db = conn['snippets']
 end

  get '/' do
    @recent = @db['snippet'].find().sort({_id: -1})
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/create' do
    record = {title: params[:title], code: params[:code]}
    @db['snippet'].save(record)
    flash[:notice] = "Snippet Saved"
    redirect "/"
  end
  
end
