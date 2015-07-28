# Make sure SQLite can be accessed.
require "sqlite3"

# access to crud methods
require_relative "crud.rb"
require_relative "checksplit.rb"

# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("food_club.db")

# Make the table.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS check_splitter (occurence INTEGER PRIMARY KEY, cost INTEGER, tip_percent INTIGER, people_paying INTEGER);")
# =>                                                          01,  70, .20, 3

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true

#_________________________________TESTING________________________________
#empty list of plants array
list_of_plants = []

puts "let's enter some plants into our backyard catalog \n\ What is the plant's name?"
plant_name = gets.chomp.to_s

puts "If that plant has a flower, enter the color, if not just hit enter or type noda."
flower_color = gets.chomp.to_s

puts "How many of these plants are in your backyard?"
quantity = gets.chomp.to_i

add_plant(plant_name, flower_color, quantity)

puts "This will take a while, I've seen your backyard. How's abouts we add all of the 
information at one time. So please type plant name, flower color, and quantity _just a number_."
one_plant_row = gets.chomp

#looping to add the information over and over
begin
#puts one_plant_information into an array by breaking at the comma
one_plant_information = one_plant_row.split(", ")

#takes that array and pushes to a bigger array
list_of_plants.push(one_plant_information)

puts "add another?"
answer = gets.chomp.downcase

#***need to do a loop to continue to do adding
end until answer == "no"

#if person only enters one row of information below works
add_plant(one_plant_information[0], one_plant_information[1], one_plant_information[2],)

puts full_backyard

puts " would you like to delete some? if so enter the name of the plant you wish to delete."
delete_name = gets.chomp

delete_plant_row(delete_name)

puts full_backyard