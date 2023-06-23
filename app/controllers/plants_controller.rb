class PlantsController < ApplicationController
    wrap_parameters format: []

    def index
        plants = Plant.all
        render json: plants, status: :accepted 
    end

    def show
        plants = Plant.find_by(id: params[:id])
        render json: plants, status: :accepted 
    end

    def create
        new_plant = Plant.create(plant_params)
        render json: new_plant, status: :created
    end

    private
    def plant_params
        params.permit(:name, :image, :price)
    end
end
