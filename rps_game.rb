# all players pick one of options

options = ['rock', 'paper', 'scissors']

# player vs computer 

loop do
  puts "Start Rock Paper Scissors"

  # player & cpu pick oen choice

  begin
    puts "Select one: (rock/paper/scissors)"
    user_choice = gets.chomp.downcase
  end until options.include?(user_choice)
  
  cpu_choice = options.sample

  # check result

	if user_choice == cpu_choice
	  puts "It's a tie!"
	  
	elsif (user_choice == 'rock' && cpu_choice == 'scissors') || 
        (user_choice == 'paper' && cpu_choice == 'rock') || 
        (user_choice == 'scissors' && cpu_choice == 'paper')
		puts "Your #{user_choice} vs computer #{cpu_choice}"
    puts "You won!"
	else
		puts "Your #{user_choice} vs computer #{cpu_choice}"
    puts "cpu won!"
	end

	# player continue?

	puts "Play again? (yes/no)"
	answer = gets.chomp.downcase
	break if (answer != 'yes' && answer != 'y')
end 

puts "Have Fun!"