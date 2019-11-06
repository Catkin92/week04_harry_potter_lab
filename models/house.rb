require_relative('../db/sql_runner')
require_relative('student.rb')

class House

  attr_reader :id
  attr_accessor :name, :student_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @student_id = options['student_id'].to_i
  end

  def save
    sql = "INSERT INTO students
    (name,
     student_id)
     VALUES ($1, $2)
     RETURNING *"
     values = [@name, @student_id]
     @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM houses"
    houses =  SqlRunner.run(sql)
    result =  houses.map { |house| House.new(house) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    house =  SqlRunner.run(sql, [id])
    return House.new(house[0])
  end
end
