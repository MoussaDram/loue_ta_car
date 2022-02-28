class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      redirect_to cars_path(@car), notice: "Car was successfully Booked."
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_at, :end_at)
  end
end
