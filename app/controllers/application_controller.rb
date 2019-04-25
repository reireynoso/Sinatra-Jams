require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/artists" do 
    @artists = Artist.all
    erb :index
  end

  get "/artists/new" do 
    erb :new
  end

  post "/artists" do 
    @artist = Artist.create(params)
    redirect to "/artists/#{@artist.id}"
  end

  get "/artists/:id" do 
    @artist = Artist.find(params[:id])
    erb :show
  end
end
