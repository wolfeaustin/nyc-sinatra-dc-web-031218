class LandmarksController < ApplicationController

  get '/landmarks' do #gets all of the landmarks
    @landmarks = Landmark.all
    erb '/landmarks/index'.to_sym
  end

  get '/landmarks/:id' do #gets a certain landmark
    @landmark = Landmark.find(params[:id])
    erb '/landmarks/show'.to_sym
  end

  get '/landmarks/new' do
    erb 'landmarks/new'.to_sym
  end
  
end
