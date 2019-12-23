#object, class, how to def class, attr_reader, attr_writer, attr_accessor, access specifiers, class methods, instance methods

class Employee

  # attr_reader :salary, :name  allows reading of variable without implementing getter method
  # attr_writer :salary, :name  allows writing of variable without implementing setter method
  attr_accessor :salary, :name  #allows both read and write operations
  

  def show_policies
    puts "asddmas"
  end

  def show_emp_name       #instance methods are associated with objects, they are primarily used to modify object attributes, called with object name ex emp.show_emp_name
    puts "#{name}"
  end

  #private :set_sal, :set_name, :show_sal   only accessible by instance and class methods (cannot be explicitly accessed if inherited)
  public  :show_policies, :show_emp_name    #can be accessed by instance and class methods as well as non memeber methods
  #protected                  #only accessible by instance and class methods (can be explicitly accessed if inherited)

  

  @@temp = 2                  #class variables are associated with class, i.e. all objects of class share the same variable, represented by @@
  def initialize(name, salary)
    @name = name              #instance variables are associated with objects, i.e. all objects of class have their own copy of variable, represented by @
    @salary = salary
  end
  
  def self.class_method  #def Employee.class_method  #class methods are associated with class, they are primarily used to modify class variables, called with class name ex Employee.class_method 
    p "class method"
  end

  #def name                 #getter - used to read value of variable
  # @name
  #end

  #def set_name(name)           #setter - used to set value of variable
  # @name = name
  #end
  

end

emp = Employee.new("Dev", 100000)
Employee.class_method

puts Employee.class_variables
puts emp.instance_variables


puts "#{emp.name}: #{emp.salary}"
# puts emp.name
# puts emp.salary
#emp.set_name('Raj')
emp.name = 'Raj'
emp.salary = 200000
puts "#{emp.name}: #{emp.salary}"
