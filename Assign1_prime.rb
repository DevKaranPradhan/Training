print "enter a number "
num = gets.chomp.to_i

ct=0

if(num<2)
	puts "#{num} is not prime"

else
	i=2
	while(i<=num/2)
		if(num%i==0) 
			ct+=1
			break
		end
		i+=1
	end
end

if(ct>=1) 
	puts "#{num} is not prime"
else
	puts "#{num} is prime"
ends

