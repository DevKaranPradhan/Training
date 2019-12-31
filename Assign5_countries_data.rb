module Check_country

  def check_loan_avb? population, gdp, states, state
    return true if population >= 3000000 && gdp >= 1500 && states >= 10 && state == 'developing'
    false
  end

  def check_seat_avb? population, gdp, states, state
    return true if population >= 100000 && gdp >= 2000 && states >= 20 && state == 'developed'
    false
  end

  def can_win_war? army_str, gdp 
    return true if army_str >= 20000 && gdp >= 1500 
    false
  end

end


class Country

  include Check_country

  attr_accessor :population, :country_name, :gdp, :num_states, :army_str, :state_of_ctr, :country_code
  @@code = 0

  def initialize c_name, population, gdp, states, army_strength, state 
    @country_name = c_name
    @population = population
    @gdp = gdp
    @num_states = states
    @army_str = army_strength   
    @state_of_ctr = state
    @@code += 1
    @country_code = @@code
  end

  def check_loan_avb? population=self.population, gdp=self.gdp, states=self.num_states, state=self.state_of_ctr
    super
  end

  def check_seat_avb? population=self.population, gdp=self.gdp, states=self.num_states, state=self.state_of_ctr
    super
  end

  def can_win_war? population=self.army_str, gdp=self.gdp
    super
  end
   
end

def create_obj
  puts "enter country name :"
  country_name = gets.chomp
  puts "enter population of the country :"
  population = gets.chomp.to_i
  puts "enter GDP :"
  gdp = gets.chomp.to_i
  puts "enter number of states in the country :"
  states = gets.chomp.to_i
  puts "enter strength of army :"
  army_strength = gets.chomp.to_i
  puts "what is the state of country (developing/developed)? :"
  state = gets.chomp
  country_object = Country.new country_name, population, gdp, states, army_strength, state
  puts "country code of #{country_name} is #{country_object.country_code}"
  country_object
end

countries = []
ch = 0
ind = 0

while ch != 4

  puts "---menu---"
  puts "1. enter details of country"
  puts "2. show details of a country"
  puts "3. check applicability"
  puts "4. exit"
  
  ch = gets.chomp.to_i

  case ch
  when 1
    countries.push(create_obj)
    ind+=1

  when 2

    puts "enter country code"
    cd = gets.chomp.to_i

    if cd > 0 && cd <= ind
      cd -= 1
      puts "Country name : #{countries[cd].country_name} (code : #{countries[cd].country_code})"
      puts "Population : #{countries[cd].population}"
      puts "GDP : #{countries[cd].gdp}"
      puts "Number of States : #{countries[cd].num_states}"
      puts "Army Strength : #{countries[cd].army_str}"
      puts "State of #{countries[cd].country_name}: #{countries[cd].state_of_ctr}"
    else
      puts "invalid country code"
    end

  when 3
    puts "enter country code"
    cd = gets.chomp.to_i

    if cd > 0 && cd <= ind
      cd -= 1
      puts "\n1. Check applicable for loan from IMF"
      puts "2. Check country can have a seat in UNSC"
      puts "3. Check if country can win war"
      chk = gets.chomp.to_i

      case chk
      when 1
        if countries[cd].check_loan_avb?
          puts "#{countries[cd].country_name} is applicable for loan"
        else
          puts "#{countries[cd].country_name} is not applicable for loan"
        end

      when 2
        if countries[cd].check_seat_avb?
          puts "#{countries[cd].country_name} can have a seat in UNSC"
        else
          puts "#{countries[cd].country_name} cant get a seat in UNSC"
        end

      when 3
        if countries[cd].can_win_war?
          puts "#{countries[cd].country_name} can win war"
        else
          puts "#{countries[cd].country_name} cannot win war"
        end

      else
        puts "invalid choice"
      end

    else
      puts "invalid country code"
    end

  when 4
    break
    
  else
    puts "invalid choice"
  end

end
