print "enter grade of student "
num = gets.chomp.to_i

def grade(num)

	case num
	
	when 1..5
		return "elementary"
	when 6..8
		return "middle school"
	when 9..12
		return "high school"
	else
		return "college"
	end	

end

str = grade num

puts str

