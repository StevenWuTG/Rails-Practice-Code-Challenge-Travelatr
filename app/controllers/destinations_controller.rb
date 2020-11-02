class DestinationsController < ApplicationController
    before_action :set_destination, only: [:show, :edit, :update]

    def index
        @destinations = Destination.all
        render :index
    end

    def show
        render :show
    end

    def new
        @destination = Destination.new
    end

    def create
        @destination = Destination.create(destination_params)
        redirect_to destination_path(@destination)
    end

    private

    def destination_params
        params.require(:destination).permit(:name, :country)
    end

    def set_destination
        @destination = Destination.find(params[:id])
    end

end
