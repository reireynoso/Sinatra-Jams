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

  get "/artists/:id/edit" do 
    @artist = Artist.find(params[:id])
    erb :edit
  end

  patch '/artists/:id' do
    get_artist 
    @artist.update(params[:artist])
    redirect to "/artists"
  end

  delete "/artists/:id" do
    Artist.destroy(params[:id])
    redirect to "/artists"
  end

  def get_artist 
    @artist = Artist.find(params[:id])
  end
end
