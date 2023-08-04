# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all # Optional: Clears existing restaurants if reseeding

restaurants = [
  { name: "Epicure", address: "75008 Paris", category: "french" },
  { name: "Sakura", address: "10432 Tokyo", category: "japanese" },
  { name: "Luigi's", address: "44562 Rome", category: "italian" },
  { name: "Dragon Palace", address: "20001 Beijing", category: "chinese" },
  { name: "Belgian Waffle House", address: "1000 Brussels", category: "belgian" }
]

restaurants.each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

puts "Finished seeding!"
