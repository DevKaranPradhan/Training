no_tries = 3
mnths = ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december']
len = mnths.length
wd = rand(len)

#puts mnths[wd]

guess_wd = "X"*mnths[wd].length
visit = []

i=0
while(i<mnths[wd].length)
	visit[i] = 0
	i+=1
end

def menu(no_tries, guess_wd)
	puts "Number of tries left #{no_tries}"
	puts "________________________________"
	puts "		#{guess_wd}"
	puts "________________________________"
	ch = ''
	while 1
		puts "Guess a letter "
		ch = gets
		if(ch.length>2)
			puts "invalid i/p"
		else
			return ch
		end
	end
end

while (no_tries>0)
	i=0
	ct=0

	while(i<mnths[wd].length)
		if(visit[i]==1)
			ct+=1
		end
		i+=1
	end

	if ct==mnths[wd].length
		break
	end

	ch = menu(no_tries, guess_wd)

	i=0
	while(i<mnths[wd].length)
		#puts "#{i}, #{ch[0]}, #{mnths[wd][i]}"
		if ch[0]==mnths[wd][i]&&visit[i]!=1
			break
		else
			i+=1
		end
	end

	if i==mnths[wd].length
		no_tries-=1
		puts"wrong choice! number of tries left #{no_tries}"
	else
		guess_wd[i] = mnths[wd][i]	
		visit[i] = 1
	end

end

if no_tries>0
	puts "________________________________"
	puts "		#{guess_wd}"
	puts "________________________________"
	 
	puts "You won!"
else
	puts "ded :p correct word is #{mnths[wd]}"
end

