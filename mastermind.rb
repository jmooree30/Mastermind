class Mastermind
  def initialize
puts"###########################################"
puts"                MASTERMIND!"
puts"          Can you crack the code?"
puts"*******************************************"
puts"You have 12 tries to guess a 4-digit number."
puts"    Each number can consist of integers 0-6"
puts"*******************************************"
puts""
@gametype = Gametype.new
end
end

  class Gametype
  def initialize
    puts "Press 1 to try and crack the code."
    puts ""
    puts "Press 2 to have the computer try to crack the code."
  @option1 = gets.chomp
  if @option1 == "1"
    @players = Players.new 
    choice
  else 
    @players = Players.new 
    a_i 
  end
end 
end 

  class Players
    attr_accessor :name
  def initialize
    puts"What is your name?"
    @name = gets.chomp
    puts"Ok #{@name} pick a 4 digit number 0-6. Ex.3456"
  end
end 

  def a_i
   input = gets.chomp
   tries_left = 12
   computer = Array.new(4) { '' }
  while tries_left > 0
  if computer.all?(&:frozen?)
    puts "The computer guessed the code - #{computer.inspect} in #{12 - tries_left} tries"
    break
  end
  tries_left -= 1
  computer.each.with_index do |random, index|
    random.replace(rand(0..6).to_s) unless random.frozen?
    random.freeze if random == input[index]
    end 
  if tries_left == 1
    puts "The computer failed to guess the secret code."
    puts "GAME OVER: Press 1 to play again."
  new_game= gets.chomp 
  if new_game == "1"
    Mastermind.new
    break
  end 
end 
  puts "Computer guess: #{computer.join}"
  puts "Amount of correct guesses: #{computer.count(&:frozen?)}"
  puts "Attempts left: #{tries_left}"
end
end
    
  def choice
    random_number = 4.times.map do rand(0..6) end.join
    tries_left = 12
    12.times do
    tries_left -= 1
    counter = 0
    leftovers = []
    wrong_input = []
    input = gets.chomp
    if input[0] == random_number[0] 
      counter += 1
    else
      wrong_input << input[0]
      leftovers << random_number[0]
    end
    if input[1] == random_number[1] 
      counter += 1
    else
      wrong_input << input[1]
      leftovers << random_number[1]
    end 
    if input[2] == random_number[2]
     counter += 1
   else  
     wrong_input << input[2]
     leftovers << random_number[2]
    end 
    if input[3] == random_number[3]
      counter += 1
    else
      wrong_input << input[3]
      leftovers << random_number[3]
    end 
      intersection = wrong_input & leftovers
      position = intersection.length
    puts "Correct numbers: #{counter}"
    puts "Numbers out of position: #{position}"
    puts "Attempts left: #{tries_left}"
    if counter == 4 
      puts "You da man, YOU DA MAN! WOOO!"
      if tries_left == 1
        puts "You lose, you suck."
      end  
  end
  end 
end  


Mastermind.new
