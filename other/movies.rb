
	movies = {
		Big: 4,
		Epic: 5,
		Pirates_of_the_caribbean: 3,
		The_Matrix: 4.5,
		Bodyguard: 4,
		James_and_the_giant_peach: 3.5
	}

	puts "Hey there tink machine, please select one of the following options."
	puts "List -- Lists all movies."
	puts "Add -- Add's a movie to the list of movies."
	puts "Delete -- Deletes a movie from the list of movies."
	puts "Update -- Updates a movie already in the list of movies."

	choice = gets.chomp
	
	choice.downcase! 


	case choice

	when "add"
		puts "Please give me the name of the movie you'd like to add."
		title = gets.chomp

		if movies[title.to_sym].nil?
			puts "Please give me a rating for that movie."
			rating = gets.chomp
			movies[title.to_sym] = rating.to_i
			puts "Thanks, your movie has been added to the list :)"

		else
			puts "Oh shoot, I think that title is already in the list, sorry."
		end

	when "delete"
		puts "Sure no problem, which movie would you like to remove from the list?"
		title = gets.chomp

		if movies[title.to_sym].nil?
			puts "Woops, that movie isn't even in the list?"

		else
			movies[title.to_sym].delete
			puts "Alright, #{title} has been removed from the list."
		end

	when "list"
		puts "Sure, here's a list of all movies currently in the movie list."
		movies.each do |movie,rating|
			puts "#{movie}: #{rating}"
		end

	when "update"
		puts "Okay, what movie rating would you like to update?"
		title = gets.chomp

		if movies[title.to_sym].nil?
			puts "Sorry but, that movie isn't in the list. Maybe list all movies and be sure the spelling is the same."

		else
			puts "got it, you'd like to update #{title}, what new rating would you like to give it?"
			rating = gets.chomp

			movies[title.to_sym] = rating.to_i
			puts "Awesome, #{title} has been updated with a new rating of #{rating}."
		end


	end