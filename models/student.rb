require_relative('../db/sql_runner')

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age'].to_i
  end

  def save
    sql = "INSERT INTO students
    (first_name,
     last_name,
     house,
     age)
     VALUES ($1, $2, $3, $4)
     RETURNING *"
     values = [@first_name, @last_name, @house, @age]
     @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def house
    return @house
  end

  def self.all
    sql = "SELECT * FROM students"
    students =  SqlRunner.run(sql)
    result =  students.map { |student| Student.new(student) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    student =  SqlRunner.run(sql, [id])
    return Student.new(student[0])
  end
end
