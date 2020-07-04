class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
  end

  def show
    if birds = Bird.find_by(id: params[:id])
    # render json: {id: birds.id, name: birds.name, species: birds.species }
      render json: birds.slice(:id, :name, :species)
    else
      render json: {message: 'Bird not found'}
    end
  end


end