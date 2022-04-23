class SpicesController < ApplicationController
  def index
    @spices = Spice.all
    render json: @spices,
           except: [:created_at, :updated_at],
           status: :ok #, except: [:created_at, :updated_at]
  end

  def show
    spice = Spice.find_by(id: params[:id])
    if spice
      render json: spice, status: :ok
    else
      render json: { error: "Spice not found" }, status: :not_found
    end
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.update(spice_params)
      render json: spice, status: :ok
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  def destroy
    spice = Spice.find_by(id: params[:id])
    if spice
      spice.destroy
      render json: {}, status: :ok
    else
      render json: { error: "spice not found" }, status: :not_found
    end
  end

  private

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end
