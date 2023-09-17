class Api::V1::GlassesController < ApplicationController
    def index
        @glasses = Glass.all

        render json: @glasses
    end
    
    def show
        @glass = Glass.find(params[:id])

        render json: @glass
    end
end
