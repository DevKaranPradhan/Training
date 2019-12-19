class Account

	@@no_of_acc = 0

	attr_accessor :acc_id
	
	def initialize
		@balance = 0
		@@no_of_acc +=1
		@acc_id = @@no_of_acc
	end

	def deposit(amt)
		@balance += amt
	end

	def withdraw(amt)
		if(amt<=@balance)
			puts "amount successfully withdrawn"
			@balance -= amt
			#puts "current balance: #{@balance}"
		else
			puts "insufficient balance"
			#puts "current balance: #{@balance}"
		end
	end

	def balance
		puts "current balance: #{@balance}"
	end

	def interest(r)
		puts "Enter number of months" 
		t = gets.chomp.to_i

		si = @balance*r*t/12

		puts "Simple interest: #{si}"
	end

end

class Current < Account
#	@@Croi = 0.10

	#def calc
	#	interest @@Croi
	#end
	
	def interest(r=0.10)
		super
	end

end

class Savings < Account
#	@@Sroi = 0.11

	#def calc
	#	interest @@Sroi
	#end

	def interest(r=0.11)
		super
	end

end

class User
	
	attr_accessor :acc, :type
	
	def initialize(obj)
		@acc = obj
		if obj.class == Current
			@type = "Current"
		else
			@type = "Savings"
		end 
	end

end

def open_acct
 	puts "Open account"
	puts "1. Current Account\n2. Savings Account"
	ch = gets.chomp.to_i
	
	while true
		case ch
		when 1
			obj1 = Current.new
		when 2
			obj1 = Savings.new
		else
			puts "invalid input"
		end
		if(ch==1||ch==2)	
			break
		end
	end		
	
	return User.new(obj1)	
end


ch = 0
users = []
users[0] = open_acct
ct = 0
ind = 0
while ch!=7

	puts "---menu---"
	puts "1. Open another acct\n2. Deposit\n3. Withdraw\n4. Interest\n5. Account details\n6. Use account\n7. exit"
	ch = gets.chomp.to_i
	
	case ch
	when 1
		ct+=1
		users[ct] = open_acct
	when 2
		puts "Enter amount to deposit"
		amt = gets.chomp.to_i
		users[ind].acc.deposit(amt)
		puts "Amount Successfully deposited"
	when 3
		puts "Enter amount to deposit"
		amt = gets.chomp.to_i
		users[ind].acc.withdraw(amt)
		puts "Amount Successfully withdrawn"
	when 4
		users[ind].acc.interest
	when 5
		puts "ID #{users[ind].acc.acc_id}: #{users[ind].type} account" 
		users[ind].acc.balance
		# if users[ind].type == 1
		# 	puts "ID #{users[ind].acc.acc_id}: Current account\nBalance: #{users[ind].acc.balance}"
		# else
		# 	puts "ID #{users[ind].acc.acc_id}: Savings account\nBalance: #{users[ind].acc.balance}"
		# end
	when 6
		temp = ct+1
		while true
			puts "Enter account id"
			temp = gets.chomp.to_i
			temp -= 1
			if temp<=ct
				break
			else 
				puts "Account doesnt exist"
			end
		end	
		ind = temp
		
	when 7
		break

	else
		puts "invalid input"
	end
		
end

