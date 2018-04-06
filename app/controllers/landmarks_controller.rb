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
    if params[:figure_id] == "look_to_userinput"
      new_figure = Figure.create(name: params[:new_figure])
      @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed].to_i, figure_id: new_figure.id)
    else
      @landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed], figure_id: params[:figure_id].to_i)
    end
    redirect to '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb '/landmarks/edit'.to_sym
  end

  patch "/landmarks/:id" do
    puts params
    landmark = Landmark.find(params[:id])
    if params[:figure_id] == "look_to_userinput"
      new_figure = Figure.create(name: params[:new_figure])
      landmark.update(name: params[:name], year_completed: params[:year_completed].to_i, figure_id: new_figure.id)
    elsif params[:figure_id] == "none"
      landmark.update(name: params[:name], year_completed: params[:year_completed].to_i, figure_id: nil)
    else
      landmark.update(name: params[:name], year_completed: params[:year_completed], figure_id: params[:figure_id].to_i)
    end

    redirect to "/landmarks/#{params[:id]}"
  end




end
