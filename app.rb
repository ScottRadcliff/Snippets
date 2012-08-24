require 'sinatra/base'
class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/snippet/:action' do
    if params[:action] == "new"
      "hello"
    end
  end
end
