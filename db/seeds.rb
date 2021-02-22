Mechanic.delete_all
Ride.delete_all

@mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
@mechanic_2 = Mechanic.create(name: "Newman", experience: 2)
@ride_1 = @mechanic_1.rides.create(name: "Roller Coaster", thrill: 6, open: true)
@ride_2 = @mechanic_1.rides.create(name: "Spinny SpaceShip", thrill: 8, open: false)
