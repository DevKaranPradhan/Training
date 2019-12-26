print "enter phone number "
num = gets

if(num.match(/\A[1-9][0-9]{9}\Z/))
	puts "valid phn num"
else
	puts "invalid phn num"
end

print "enter email address "
email = gets

if(email.match(/\A[a-zA-Z0-9]+[._]*[a-zA-Z0-9]*['@'][a-zA-Z]+[.][a-zA-Z]+\Z/))
	puts "valid email"
else
	puts "invalid email"
end


print "enter name "
name = gets

if(gen.match(/\A[a-zA-Z' ']+\Z/))
	puts "valid name"
else
	puts "invalid name"
end

print "enter gender "
gen = gets

if(gen.match(/\A[MFmf]\Z/))
	puts "valid gen"
else
	puts "invalid gen"
end

print "enter amount "
amount = gets

if(gen.match(/\A[0-9]*[.]?[0-9]+\Z/))
	puts "valid amount"
else
	puts "invalid amount"
end

