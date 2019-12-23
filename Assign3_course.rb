class Result

  attr_accessor :per, :stu_id, :marks, :id, :sub_topper, :topper, :sub_topper_id, :high_per  

  @@id = 0
  @@sub_topper = [0,0,0,0,0,0,0,0]
  @@sub_topper_id = [0,0,0,0,0,0,0,0]
  @@topper = 0
  @@high_per = 0.0
  
  def initialize(name, marks)
    @@id+=1
    @stu_id = @@id
    @name = name
    @marks = marks
  end

  # def set_marks()
  #   @marks = []
  #   i=0
  #   puts "Enter marks"
  #   while i<8
  #     @marks[i] = gets.chomp.to_i 
  #     i+=1
  #   end
    
  # end

  def percentage
    ct = 0.0
    @marks.each do |a|
      ct += a
    end
    @per = ct/8.0
  end

  def self.sub_hm(stu)
    stu.each do |ele|
      i=0
      while i<8
        if ele.marks[i]>@@sub_topper[i]
          @@sub_topper[i] = ele.marks[i]
          @@sub_topper_id[i] = ele.id
        end
        i+=1
      end
    end

    for i in 0..7 do
      puts "Highest marks in subject #{i+1}: stu_id-#{@@sub_topper_id[i]} marks-#{@@sub_topper[i]}"
    end
  end

  def self.topper(stu)
    stu.each do |ele|
      if ele.per > @@high_per
        @@high_per = ele.per
        @@topper = ele.stu_id
      end
    end

    puts "Topper: stu_id-#{@@topper} percentage-#{@@high_per}"
  end

end


puts "Enter number of students "
ct = gets.chomp.to_i

obj = []

for i in 0..ct-1 do
  p "Enter name of student #{i+1}" 
  name = gets
  marks = []
  j=0
  puts "Enter marks"
  while j<8
    marks[j] = gets.chomp.to_i  
    j+=1
  end
  
  obj[i] = Result.new(name, marks)
  puts "percentage = #{obj[i].percentage}"
end

Result.topper(obj)
Result.sub_hm(obj)
