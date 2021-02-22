require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash
    
    get '/songs' do 
        @songs = Song.all 
        erb :'songs/index'
    end

    get '/songs/new' do 
        @artists = Artist.all 
        @genres = Genre.all 
        erb :'songs/new'
    end

    post '/songs' do 
        @song = Song.create(params[:song])
        if !params[:artist][:name].empty?
          @song.artist = Artist.create(name: params[:artist][:name])
          @song.save 
        end
        flash[:message] = "Successfully created song."
        redirect to "songs/#{@song.slug}"
    end

    
    
    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/show'
    end
    
   
    
end