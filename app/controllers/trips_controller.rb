class TripsController < ApplicationController
  def index
    @trips = Trip.sorted_by_origin
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @trip.save
      flash[:notice] = "Trip created successfully."
      redirect_to(trips_path)
    else
      render("new")
    end
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:notice] = "Trip updated successfully."
      redirect_to(trips_path)
    else
      render("edit")
    end
  end

  def delete
    @trip = Trip.find(params[:id])
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    flash[:notice] = "Trip destroyed successfully."
    redirect_to(trips_path)
  end

  private

  def trip_params
    params.require(:trip).permit(
      :travel_from,
      :travel_from_local_date,
      :travel_to,
      :travel_to_local_date,
      :return,
      :retrun_from,
      :return_from_local_date,
      :return_to,
      :retrun_to_local_time,
      :travel_size,
      :return_size,
      :sender_id,
      :traveler_id,
    )
  end
end
