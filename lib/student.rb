class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name, grade, id = nil)
    @name = name 
    @grade = grade
    @id = id
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        grade TEXT
        )
        SQL
    DB[:conn].execute(sql) 
  end
  
  def self.drop_table
    sql =  "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql) 
  end
  
  def save(name, grade)
    sql = "INSERT INTO students (name, grade) VALUES (?, ?)"
    DB[:conn].execute(sql, name, grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end

    it 'saves an instance of the Student class to the database' do
      Student.create_table
      josh.save
      expect(josh.id).to eq(1)
      expect(DB[:conn].execute("SELECT * FROM students")).to eq([[1, "Josh", "9th"]])
    end

end
