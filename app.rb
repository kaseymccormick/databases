class backyard
  def initialize(plant_id)
    @p_id = plant_id
  end
  
  def self.all
    CONNECTION.execute('SELECT * FROM backyard;')
  end

  def add_plant(plant_name, flower_color, quantity)
    CONNECTION.execute("INSERT INTO backyard (name, flower_color, quantity) VALUES ('#{plant_name}','#{flower_color}','#{quantity}');")
  end

  def change_plant_name(new_plant_name)
    CONNECTION.execute("UPDATE backyard SET name = '#{new_plant_name}' WHERE id = #{@p_id};")
  end


  def name
    result = CONNECTION.execute("SELECT name FROM students WHERE id = #{@p_id};")
    result.first["name"]
    # result[0]["name"]
  end
end