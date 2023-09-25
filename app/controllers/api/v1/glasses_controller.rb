class Api::V1::GlassesController < ApplicationController
    def index
        glasses = Glass.all
        response_data = glasses.map { |glass| set_data(glass) }
        
        render json: response_data
    end
    
    def show
        glass = Glass.find(params[:id])
        response_data = set_data(glass)
        
        render json: response_data
    end

    private

    def set_data(glass)
        {
            id: glass.id,
            sku: glass.sku,
            name: glass.name,
            brand: glass.brand,
            price: glass.price,
            color: glass.color,
            frame: glass.frame,
            material: glass.material,
            measure: glass.measure,
            woman: glass.woman,
            man: glass.man,
            photos: glass.photos.map { |p| p.url }
        }
    end
end
