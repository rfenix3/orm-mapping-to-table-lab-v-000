class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
  attr_accessor :name, :grade
  attr_reader :id
  
  def initialize(name:, grade:, id:nil)
    @name = name 
    @grade = grade
    @id = id
  end
      it 'has a name and a grade' do
      student = Student.new("Tiffany", "11th")
      expect(student.name).to eq("Tiffany")
      expect(student.grade).to eq("11th")
    end

    it 'has an id that is readable but not writable' do
      expect{josh.id = 1}.to raise_error(NoMethodError)
    end

end
