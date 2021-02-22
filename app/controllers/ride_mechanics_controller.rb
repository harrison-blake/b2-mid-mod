class RideMechanicsController < ApplicationController
  def new
    new_ride = Ride.find(params[:id])
    new_mechanic = Mechanic.find(params[:mechanic_id])

    RideMechanic.create!(ride: new_ride, mechanic: new_mechanic)

    redirect_to "/mechanics/#{params[:mechanic_id]}"
  end
end
