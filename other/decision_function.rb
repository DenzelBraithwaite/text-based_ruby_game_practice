#MAKES A LOOP THAT ACCEPTS 5 ARGUMENTS AS 'CHOICES', 1 OF WHICH BEING THE OPTION TO BREAK THE LOOP AND CONTINUE.
def dec_loop(dec1, dia1, dec2, dia2, dec3, dia3, dec4, dia4, breakif) #CASE OPTIONS SHOULD BE CAPITALIZED SINCE USER INPUT IS.
	puts "You:\n'#{dec1}'\n'#{dec2}'\n'#{dec3}'\n'#{dec4}'\n"
	puts "\n Type '#{breakif}' to progress."
	
	choice = "" #DECLARE CHOICE OUTSIDE OF "UNTIL CHOICE" LOOP TO PROMPT INSIDE OF LOOP TO PREVENT CASE STATEMENT FROM INFINITE LOOP.
	until choice == breakif
		choice = String(gets.chomp.capitalize)
		#LOOPS PROMPT UNLESS BREAKIF ARGUMENT IS PASSED / MATCHED.
		until choice == dec1 || choice == dec2 || choice == dec3 || choice == dec4 || choice == breakif
			system("cls")
			puts "You:\n'#{dec1}'\n'#{dec2}'\n'#{dec3}'\n'#{dec4}'\n"
			puts "\n Type '#{breakif}' to progress."
			choice = String(gets.chomp.capitalize)
		end

		case choice #DEC_LOOP PARAMETERS ALLOW ARGUMENTS IN PAIRS, DECISION AND DIALOGUE BASED ON DECISION.
			when dec1 then puts dia1
			when dec2 then puts dia2
			when dec3 then puts dia3
			when dec4 then puts dia4
		end
	end
end

	


dec_loop('Left', 'You turn left and walk down a hallway.', 'Right', 'You turn right and walk down a hallway', 'Straight', 'You walk straight down a hallway', 'Nothing', 'you do nothing', 'Continue')

