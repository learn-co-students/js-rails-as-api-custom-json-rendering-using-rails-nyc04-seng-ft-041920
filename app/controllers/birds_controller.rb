class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    render json: birds, only: [:id, :name, :species] 
    #same as above
    #render json: birds, except: [:created_at, :updated_at]
    #render json: birds.to_json(except: [:created_at, :updated_at]) 
  end
 
  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
    
    # While slice works fine for a single hash, as with bird, 
    # it won't work for an array of hashes like the one we have in our index action 
    # render json: bird.slice(:id, :name, :species)

    # if no bird send error message
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end