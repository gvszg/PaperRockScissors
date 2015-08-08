class Player
  attr_accessor :hand
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def hand_shape
    puts "#{name} choosed #{hand.value} gesture!"
  end
end

class Human < Player
  def pick_hand
    begin
      puts "Select one: (rock/paper/scissors)"
      choice = gets.chomp.downcase
    end until Game::OPTIONS.include?(choice)

    self.hand = Hand.new(choice)
  end
end

class Computer < Player
  def pick_hand
    self.hand = Hand.new(Game::OPTIONS.sample)
  end
end

class Hand
  include Comparable 

  attr_reader :value
  
  def initialize(value)
    @value = value
  end

  def <=>(another_hand)
    if value == another_hand.value
      0
    elsif (value == 'paper' && another_hand.value == 'rock') || (value == 'rock' && another_hand.value == 'scissors') || (value == 'scissors' && another_hand.value == 'paper')  
      1
    else
      -1 
    end
  end
end

class Game
  OPTIONS = ['rock', 'paper', 'scissors']

  attr_reader :player, :computer

  def initialize
    @player = Human.new("You")
    @computer = Computer.new("Machine")
  end

  def compare_hands
    if player.hand == computer.hand 
      puts "It's a tie!"
    elsif player.hand > computer.hand
      puts "#{player.name} won!"  
    else
      puts "#{computer.name} won!"
    end
  end

  def play_again
    puts "Play again? (yes/no)"
    answer = gets.chomp.downcase
    play unless (answer == 'no' || answer == 'n')
    puts "Have Fun!" if (answer == 'no' || answer == 'n')
  end

  def play
    player.pick_hand
    computer.pick_hand
    player.hand_shape
    computer.hand_shape
    compare_hands
    play_again
  end
end

game = Game.new.play
