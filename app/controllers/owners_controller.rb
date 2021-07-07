class OwnersController < ApplicationController

  get '/owners' do
    # binding.pry
    @owners = Owner.all
    erb :'/owners/index' 
  end

  get '/owners/new' do 
    # binding.pry
    @pets = Pet.all
    erb :'/owners/new'
  end

  post '/owners' do
    # binding.pry
  @owner = Owner.create(params[:owner])
  if !params["pet"]["name"].empty?
    @owner.pets << Pet.create(name: params["pet"]["name"])
  end
  redirect "owners/#{@owner.id}"
end

  get '/owners/:id/edit' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do 
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  patch '/owners/:id' do
    # binding.pry
    if !params[:owner].keys.include?("pet_ids")
    params[:owner]["pet_ids"] = []
    end
 
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    redirect "owners/#{@owner.id}"
end
end