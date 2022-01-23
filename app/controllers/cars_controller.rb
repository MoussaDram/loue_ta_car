class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save!
      redirect_to cars_path(@car), notice: "Car was successfully created."
    else
      render :new
    end
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car), notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path(@car), notice: "Car was successfully destroyed."
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :address, :price, :description, :user_id)
  end
end
