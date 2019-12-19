class Portal
	
	attr_accessor :orders, :status, :total

	@@item_count = {}
	@@temp_ct = {}
	@@menu = {}
	
	def initialize()
		@orders = {}
		@total_amt = 0
		@status = "Cart Empty"
	end

	def self.set_menu
		
		puts "enter number of items"
		ct = gets.chomp.to_i
		
		for i in 0..ct-1 do
			print "enter name of food item #{i+1} "
			str = gets.chomp
			print "enter price "
			@@menu[str] = gets.chomp.to_i
			print "enter quantity "
			@@item_count[str] = gets.chomp.to_i
		end
		@@temp_ct = @@item_count
	end

	def self.show_menu
		
		puts "\n---menu---"
		keys = @@menu.keys
		puts "name\t\t price\t\t qty"
		keys.each do |item|
			puts "#{item}\t\t Rs#{@@menu[item]}\t\t #{@@item_count[item]}"
		end

	end

	def add_to_cart
		
		if @status != "Order Placed"	
			print "Enter item: "
			str = gets.chomp
			ct=0

			keys = @@menu.keys
			keys.each do |item|
				if str == item
					break
				else
					ct+=1
				end
			end

			# if ct==keys.size
			# 	puts "item not found"
			# 	return
			# end
			# keys = @orders.keys
			# keys.each do |item|
			# 	if str == item
			# 		@orders[str] += 1
			# 		@@item_count[str] -= 1
			# 	else
			# 		@orders[str] = 1
			# 		@@item_count[str] -= 1 
			# 	end
			# end
		
			if ct==keys.size
				puts "item not found"
			
			elsif @@item_count[str] == 0
				puts "item not available"
			
			elsif @orders.key?(str) == false
				@orders[str] = 1
				@@item_count[str] -= 1 
				puts "item added to cart\n"
				@status = "Item added to cart"
			
			else
				@orders[str] += 1
				@@item_count[str] -= 1 
				puts "item added to cart\n"
				@status = "Item added to cart"
			end
		
		else
			puts "order already placed"
		end

	end

	def show_cart
		puts "\nname\t\t qty\t\t price"
		total = 0
		@orders.each do |key, val|
			puts "#{key}\t\t #{val} \t\t Rs#{val*@@menu[key]}"
			total += val*@@menu[key]
		end
		puts "total = #{total}\n"

	end

	def check_item
	
		print "enter item name "
		item = gets.chomp
		if @@item_count[item]==0
			puts "item not available"
		else
			puts "item available"
		end

	end
	
	def check_status
		puts "Status- #{@status}"
	end

	def place_order
	
		if @status == "Item added to cart"
			@total = 0

			@orders.each do |key, val|
				@total += val*@@menu[key]
			end
			
			puts "total amount= #{total}"
			puts "order place successfully"
			@status = "Order Placed"
			# puts "1.create new order\n2.exit"
			# ch = gets.chomp.to_i
			# return ch

		elsif @status == "Cart Empty"
			puts "No item in cart"
		elsif @status == "Order Placed" 
			puts "Order already placed"
		end
	end

	def create_order
		
		if status == "Order Placed"
			puts	"Amount to be paid- Rs#{@total}"
			return Portal.new
		else
			@@item_count = @@temp_ct
			@orders = {}
		end

	end

end

Portal.set_menu
Portal.show_menu


#def start
	obj = Portal.new
	ch = 0
	ct = 1
	while ch!=7
		
		if(ct==1) 
			obj = Portal.new	
			ct = 3
		elsif ct==2
			break
		else
			ct = 3
		end

		puts "\nPortal"
		puts "1. add to cart\n2. show cart\n3. check item\n4. check status\n5. place order\n6. new order\n7. exit"
	
		ch = gets.chomp.to_i
	
		case ch
		when 1
			obj.add_to_cart
		when 2
			obj.show_cart
		when 3
			obj.check_item
		when 4
			obj.check_status
		when 5
			obj.place_order
		when 6
			obj = obj.create_order
		when 7
			break
		else
			puts "invalid input"
		end
		
	end
#	puts ch, ct
# end

# start


