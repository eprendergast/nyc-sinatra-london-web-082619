class LandmarksController < ApplicationController

  #index
  get "/landmarks/?" do
    @landmarks = Landmark.all
    erb :"/landmarks/index"
  end

  #new
  get "/landmarks/new" do
    @landmark = Landmark.new
    erb :"landmarks/new"
  end

  #create {"landmark"=>{"name"=>"Test", "year_completed"=>"1980"}}
  post "/landmarks/?" do
    @landmark = Landmark.create(params["landmark"])
    redirect "/landmarks/#{@landmark.id}"
  end

  #show
  get "/landmarks/:id" do
    @landmark = Landmark.find(params["id"])
    erb :"landmarks/show"
  end

  #edit
  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params["id"])
    erb :"landmarks/edit"
  end

  #update
  patch "/landmarks/:id" do
    @landmark = Landmark.find(params["id"])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  #delete

end
