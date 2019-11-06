require('pry')
require_relative('../models/student.rb')

student1 = Student.new(
  'first_name' => 'Pansy',
  'last_name' => 'Parkinson',
  'house' => 'Slytherin',
  'age' => 13)

student2 = Student.new(
'first_name' => 'Ernie',
'last_name' => 'Macmillan',
'house' => 'Hufflepuff',
'age' => 12)

student3 = Student.new(
'first_name' => 'Luna',
'last_name' => 'Lovegood',
'house' => 'Ravenclaw',
'age' => 15)

student4 = Student.new(
'first_name' => 'Colin',
'last_name' => 'Creevey',
'house' => 'Gryffindor',
'age' => 11)

house1 = House.new(
  'name' => 'Gryffindor',
  'student_id' => student4.id
)
house2 = House.new(
  'name' => 'Hufflepuff',
  'student_id' => student2.id
)
house3 = House.new(
  'name' => 'Ravenclaw',
  'student_id' => student3.id
)
house1 = House.new(
  'name' => 'Slytherin',
  'student_id' => student1.id
)

student1.save
student2.save
student3.save
student4.save

house1.save
house2.save
house3.save
house4.save

binding.pry

nil
