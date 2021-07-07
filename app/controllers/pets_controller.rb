class PetsController < ApplicationController

  get '/pets' do
    # binding.pry
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    # binding.pry
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    # binding.pry
    @pet = Pet.create(params[:pet])
    # @pet = Pet.create(:name => params[:name], :owner_id => params[:owner_id])
    if !params["owner"]["name"].empty?
    @pet.owners << Owner.create(name: params["owner"]["name"])
  end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end

