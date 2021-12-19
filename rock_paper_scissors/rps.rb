#ROCK PAPER SCISSORS GAME
puts "\nWelcome,\n This is a simple game of Rock, Paper, Scissors.\n The first to win best 2 out of 3, wins!\n Good luck, and may the odds be ever in your favor."
sleep(4.5)
puts "\nPress enter to continue."
gets.chomp
system('cls')
#INITIALIZE SCORES
player_score = 0
computer_score = 0

#INITIALIZE CHOICES
player_choice = ''
computer_choice = ''

#ARRAY FOR COMPUTER TO RANDOMLY PICK FROM
choices = ['Rock', 'Paper', 'Scissors']

#INITIALIZE ANSWER, THIS IS WHAT WILL RESTART THE GAME IF THE PLAYER WOULD LIKE TO TRY AGAIN. DEFAULT VALUE EMPTY.
answer = ''
until answer == 'No'
	
	#WIPES ANSWER TO ALLOW THE LOOP TO REPROMPT TO PLAY AGAIN.
	answer = ''
	until player_score == 2 || computer_score == 2 #BEST 2 OUT OF 3

		until player_choice == 'Rock' || player_choice == 'Paper' || player_choice == 'Scissors'
			system('cls')
			puts "Please choose:\n" ; sleep(1)
			puts "-Rock\n" ; sleep(0.5)
			puts "-Paper\n" ; sleep(0.5)
			puts "-Scissors\n" ; sleep(0.5)
			player_choice = gets.chomp.capitalize
		end

		#COMPUTER CHOOSES AFTER PLAYER CHOOSES
		computer_choice = choices.sample

		#THE GAME HAPPENS BENEATH THIS LINE, EVERY RESULTS DEPENDS ON THE CHOICES MADE BY THE COMPUTER AND THE PLAYER.
		system('cls')
		if player_choice == computer_choice
			puts "You both picked #{player_choice}, it's a tie! No points awarded."
		elsif player_choice == 'Rock' && computer_choice == 'Paper'
			puts 'You lose.'
			computer_score += 1
		elsif player_choice == 'Rock' && computer_choice == 'Scissors'
			puts 'You win.'
			player_score += 1
		elsif player_choice == 'Paper' && computer_choice == 'Rock'
			puts 'You win.'
			player_score += 1
		elsif player_choice == 'Paper' && computer_choice == 'Scissors'
			puts 'You lose.'
			computer_score += 1
		elsif player_choice == 'Scissors' && computer_choice == 'Rock'
			puts 'You lose.'
			computer_score += 1
		else player_choice == 'Scissors' && computer_choice == 'Paper'
			puts 'You win.'
			player_score += 1
		end

		sleep(2)
		puts "Player score: #{player_score}" ; sleep(1)
		puts "Computer score: #{computer_score}" ; sleep(2)
		system('cls')

		#RESETS PLAYER CHOICE
		player_choice = ''

	end

	system('cls')
	
	#PROMPTS PLAYER TO REPLACE #{ANSWER}, IF 'YES' THE LOOP RESTARTS, IF NO THE GAME ENDS.
	until answer == 'Yes' || answer == 'No'
		puts 'Would you like to play again?'
		puts '-Yes'
		puts '-No'
		answer = gets.chomp.capitalize
	end
	
	unless answer == 'No'
		#REINITIALIZE SCORES
		system('cls')
		player_score = 0
		computer_score = 0
		puts 'Rock, Paper or Scissors?'
		player_choice = gets.chomp.capitalize
	end
end

puts 'Thank you for playing!'
sleep(5)
