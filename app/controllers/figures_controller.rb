class FiguresController < ApplicationController
  
  #index
  get "/figures/?" do
    @figures = Figure.all 
    erb :"/figures/index"
  end

  #new
  get "/figures/new" do
    @titles = Title.all
    @landmarks = Landmark.all
    @figure = Figure.new
    erb :"figures/new"
  end

  #create {"figure"=>{"name"=>"Katy Perry", "title_ids"=>["1", "2"], "landmark_ids"=>["1", "3", "5", "9"]}, "title"=>{"name"=>"Queen 3"}, "landmark"=>{"name"=>"Her house"}}
  post "/figures/?" do
    @figure = Figure.create(params["figure"]) #create a new figure 
    
    if !params["title"]["name"].empty? 
      @figure.titles << Title.create(params["title"])
    end
    
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end
      
    redirect "/figures/#{@figure.id}"
  end

  #show
  get "/figures/:id" do
    @figure = Figure.find(params["id"])
    erb :"figures/show"
  end

  #edit
  get "/figures/:id/edit" do
    @figure = Figure.find(params["id"])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/edit"
  end

  #update {"_method"=>"patch", "figure"=>{"name"=>"Ron Weasly", "title_ids"=>["1", "2", "3", "4", "6"], "landmark_ids"=>["1", "2", "12"]}, "title"=>{"name"=>"Prefecr"}, "landmark"=>{"name"=>"Gryfindor"}, "id"=>"15"}
  patch "/figures/:id" do

    @figure = Figure.find(params["id"])
    @figure.update(params["figure"])

    if !params["title"]["name"].empty? 
      @figure.titles << Title.create(params["title"])
    end
    
    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(params["landmark"])
    end

    redirect "/figures/#{@figure.id}" 
  end

  #delete



end
