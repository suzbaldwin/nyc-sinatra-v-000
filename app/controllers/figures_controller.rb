class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @figure.titles << Title.create(name: params["title_name"])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params["landmark_name"])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    @figure.title = Title.find(name: params[:title][:name])
    @figure.landmark = Landmark.find(name: params[:landmark][:name])
    @figure.save
    redirect "/figures/#{@figure.id}"

  end
end
