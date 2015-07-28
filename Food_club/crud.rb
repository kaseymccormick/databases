
# ------------------------Checksplitter CRUDs-----------------------------------------


#------------------------ Create ---------------------------------------
#add a complete row
def occurance(cost, tip_percent, people)
  CONNECTION.execute("INSERT INTO check_splitter (cost, tip_percent, people) VALUES (#{cost}, #{tip_percent}, #{people} );")
end

# #add a plant name nothing else
# def add_plant_name(plant_name)
#   CONNECTION.execute("INSERT INTO check_splitter (name) VALUES ('#{student_name}');")
# end

#------------------------ Read -----------------------------------------

#read all rows and columns
def full_backyard
  CONNECTION.execute('SELECT * FROM backyard;')
end

#read specific row by id
def view_event(id)
  result = CONNECTION.execute("SELECT name FROM check_splitter WHERE id = #{id};")
  result.first["name"]
  # result[0]["name"]
end

#------------------------ Update ---------------------------------------

#change existing plant name with new name using existing id
def change_plant_name(new_plant_name, id)
  CONNECTION.execute("UPDATE backyard SET name = '#{new_plant_name}' WHERE id = #{id};")
end

#change existing plant;s flower color with new color using existing id
def change_plant_name(new_color, id)
  CONNECTION.execute("UPDATE backyard SET flower_color = '#{new_color}' WHERE id = #{id};")
end

#------------------------ Destroy --------------------------------------

#deleting plant row by name
def delete_plant_row(delete_name)
  CONNECTION.execute("DELETE FROM backyard WHERE name = '#{delete_name}';")
end
