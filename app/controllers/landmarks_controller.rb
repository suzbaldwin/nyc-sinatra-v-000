class LandmarksController < ApplicationController

  get '/landmarks/new' do

    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @figure = Figure.create(params[:figure])

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params["landmark_name"],year_completed: params["landmark_year_completed"])
    end
    @figure.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  post '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    @landmark.name = Landmark.find(name: params[:landmark][:name])
    @landmark.year_completed = Landmark.find(year_completed: params[:landmark][:year]) 
    @landmark.save
    redirect "/landmark/#{@landmark.id}"
end


end
