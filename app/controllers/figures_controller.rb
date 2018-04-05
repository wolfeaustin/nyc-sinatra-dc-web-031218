class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb '/figures/index'.to_sym
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb '/figures/show'.to_sym
  end
end
