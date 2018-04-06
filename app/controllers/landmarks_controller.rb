class LandmarksController < ApplicationController

  get '/landmarks' do #gets all of the landmarks
    @landmarks = Landmark.all
    erb '/landmarks/index'.to_sym
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb 'landmarks/new'.to_sym
  end

  get '/landmarks/:id' do #gets a certain landmark
    @landmark = Landmark.find(params[:id])
    erb '/landmarks/show'.to_sym
  end



  post '/landmarks' do
    puts params 
    # @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed])
    redirect to '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb '/landmarks/edit'.to_sym
  end




end
