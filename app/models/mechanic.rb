class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def self.average_experience
    average(:experience)
  end

  def open_rides
    rides.where(open: true)
  end

  def open_rides_by_thrill
    open_rides.order("thrill DESC")
  end
end
