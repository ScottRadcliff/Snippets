require 'sinatra/base'
require 'mongo'
require 'rack-flash'

class App < Sinatra::Base
 enable :sessions
 use Rack::Flash

  get '/' do
    erb :index
  end

  get '/new' do
    erb :new
  end

  post '/create' do
    conn = Mongo::Connection.new
    db = conn['snippets']
    record = {title: params[:title], code: params[:code]}
    db['snippet'].save(record)
    flash[:notice] = "Snippet Saved"
    redirect "/new"
  end
end
