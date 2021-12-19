# THIS IS AN RPG GAME MADE TO PRACTICE RUBY AND OFFER A SMALL FUN EXPERIENCE TO THE TESTER.

#METHOD TO CAPITALIZE PLAYER AND CONVERT TO STRING.
def gets_caps
  String(gets.chomp.capitalize)
end

#METHOD TO PAUSE DIALOGUE AND CONTINUE WHEN READY.
def continue
  gets.chomp
end

#METHOD TO ADD A LINE BETWEEN DIALOGUE.
def line
  puts "\n \n"
end

#BRIEF INSTRUCTIONS ON HOW TO PLAY THE GAME.
puts "Instructions:\n\nThis is a text-based adventure game, you will need to type actions in order to progress.\n
In most cases, your response shouldn't be longer than 1 word; example(Option 1: 'Use' weapon!) would only require you to type 'Use'.\n
All commands that are typed will be capitalized, so as long as the spelling is correct the program should behave as expected.\n
Sometimes the text will pause between dialogues intentionally.\n
In the event that you see a 'Continue...' prompt , press Enter." ; line
sleep (8)
puts "Continue..."
continue
%x{mspaint instructions.jpg} #OPENS AN IMAGE WITH INSTRUCTIONS USING MSPAINT.
puts "Enjoy :)" ; sleep(1.5)
system("cls")



# THIS INITIALIZES THE GAME, UNTIL THE PLAYER TYPES 'BEGIN', THE GAME WILL NOT START.
puts "Type 'Begin' to start your adventure."
start = gets_caps
until start == "Begin"
  puts "Type 'Begin' to start your adventure."
  start = gets_caps
end

system("cls")

#GREETING + PROMPTS PLAYER TO CHOOSE AMOUNT OF PLAYERS, ARGUMENTS ACCEPTED: 1 OR 2.
puts "Your journey is about to begin, but first please let me ask you a few questions." ; line
puts "How many adventurers will be joining us this time around?" ;line
player_count = gets.chomp # <-- WHEN I USE INTEGER(GETS.CHOMP) THE PROGRAM CRASHES IF I ENTER STRINGS. ALL INPUTS REQUIRING AN INTEGER WILL USE GETS.CHOMP THEN CONVERT TO_I ON NEXT LINE.
player_count = player_count.to_i
until player_count == 1 || player_count == 2
  system("cls")
  puts "Please decide between 1 or 2 adventurers"
  player_count = gets.chomp
  player_count = player_count.to_i
end

line

#---------------------1 PLAYER MODE ---------------------
#GREETS THE PLAYER AND RETRIEVES THEIR NAME.
case player_count
when 1 then puts "Excellent, it seems we have a brave warrior in our presence!" ; line
  puts "When we tell the tale of your courage and bravery, how should we refer to you?"
  player = gets_caps ; line
  puts "Kaz... as in the creator? No, surely it couldn't be.\n \n" if player == "Kaz"
  puts "Elisa... there are legends of an Elisa who's odor was so foul it reached the heavens. God himself banished her from his grace... but surely that couldn't be you?\n \n" if player == "Elisa"
  puts "Ahhhh #{player}, a mighty name indeed!" ; line

  #GIVES THE PLAYER THE CHOICE BETWEEN 1 - 10 TO GUESS THEIR ODDS OF WINNING THE TRIALS.
  puts "On a scale from 1 - 10, how likely do you think you'll survive these trials?"
  victory_odds = gets.chomp ;line
  victory_odds = victory_odds.to_i
  until victory_odds > 0 && victory_odds <= 10
    system("cls")
    puts "please enter a number between 1-10"
    victory_odds = gets.chomp ;line
    victory_odds = victory_odds.to_i
  end

  # INITIALLY SUPPOSED TO BE AN OPTION FOR 0, BUT A STRING CONVERTED TO_I BECOMES 0. I COULD'VE USED NUMBERS AS STRINGS.
  case victory_odds
    when 1 then puts "One? Maybe you aren't the courageous warrior we've been waiting for..."
    when 2 then puts "A modest warrior at that, I'm sure you'll do fine."
    when 3 then puts "Not the most confident of adventurers are you?"
    when 4 then puts "4, really? I was expecting a bit more from you #{player}."
    when 5 then puts "You must be fully committed to survive during the trials, a 5 won't get you very far."
    when 6 then puts "Ha! That's a start, but you'll need true conviction if you're to survive the trials."
    when 7 then puts "7 hmmm, that's not bad but in order to survive you'll need unwavering dedication."
    when 8 then puts "Impressive young warrior, but even the dauntless find fear in these trials..."
    when 9 then puts "Do not falter! It could mean the difference between returning and sharing tales of glory,\nor becoming an unfortunate fable for the next generation."
    when 10 then puts "Admirable, do me proud young warrior!"
  end

  line
  sleep(3)
  puts "Continue..."
  continue

#----------------INITIALIZE GAME----------------
  system("cls")
  player_equipment = Hash.new("Empty")

  #PROLOGUE / BEGINNING
  puts "Year: Unknown" ; sleep(0.7)
  puts "Whereabouts: Unknown" ; sleep(0.7)
  puts "Belongings: Basic garments with no equipment.\n \n" ; sleep(4)
  puts "Continue..."
  continue

  #FIRST DECISION, IF SEARCH IS PICKED, IT WILL LOOP UNTIL ONE OF THE OTHER OPTIONS ARE PICKED.
  system("cls")
  puts "You awaken in a dark room, There's a damp, musty, pungent scent that fills the area.\n \n" ; sleep(3)
  puts "You:" ; sleep(1.5)
  puts "-'Feel' your surroundings" ; sleep(0.5)
  puts "-'Look' around" ; sleep (0.5)
  puts "-'Search' inventory" ; sleep(0.5)
  puts "-'Cry' out" 
  line ; decision_1 = gets_caps ; line
  
  #FORCES DECISION FEEL,LOOK,CRY OR SEARCH. GETS FASTER WHEN REPROMPTED ON INCORRECT COMMAND AND CLEARS SCREEN.
  until decision_1 == "Feel" || decision_1 == "Look" || decision_1 == "Cry" || decision_1 == "Search"
    system("cls")
    puts "You:" ; sleep(1)
    puts "-'Feel' your surroundings" ; sleep(0.3)
    puts "-'Look' around" ; sleep(0.3)
    puts "-'Search' inventory" ; sleep(0.3)
    puts "-'Cry' out" 
    line
    decision_1 = gets_caps ; line
  end

  #PLAYER CHOOSES SEARCH, LOOPS BACK TO CHOICE BUT REMOVES SEARCH.
  if decision_1 == "Search"
    puts "You have nothing on you. 'Focus! #{player}' you think to yourself." ; line ; sleep(2)
    puts "You:" ; sleep(1)
    puts "-'Feel' your surroundings" ; sleep(0.3)
    puts "-'Look' around" ; sleep (0.3)
    puts "-'Cry' out"
    line ; decision_1 = gets_caps ; line
  end

  #FORCES DECISION FEEL, LOOK OR CRY
  until decision_1 == "Feel" || decision_1 == "Look" || decision_1 == "Cry"
    system("cls")
    puts "You:" ; sleep(1)
    puts "-'Feel' your surroundings" ; sleep(0.3)
    puts "-'Look' around" ; sleep (0.3)
    puts "-'Cry' out" 
    line ; decision_1 = gets_caps ; line
  end

  case decision_1
  #PLAYER CHOOSES FEEL.
  when "Feel"
    puts "You feel around for your surroundings as your eyes slowly adjust to the darkness." ; line ; sleep(3)
    puts "The ground feels rough and earthy, the walls are hard and jagged." ; line ; sleep(3)
    puts "'I must be in some sort of cave' you think to yourself" ; line

  #PLAYER CHOOSES LOOK.
  when "Look"
    puts "You look around in an attempt to grasp your surroundings as your eyes slowly adjust to the darkness." ; line ; sleep(3)
    puts "You can see a vague outline of what looks like a box at the end of the passage way to your left.\nTo your right there seems to be another passage way but it's darker." ; line ; sleep(3)
    puts "'I must be in some sort of cave' you think to yourself" ; line

  #PLAYER CHOOSES CRY.
  when "Cry"
    puts "You cry out in hopes that someone nearby would hear your plea." ; line ; sleep(3)
    puts "But the only voice that responds is your own, an echo." ; line ; sleep(3)
    puts "'I must be in some sort of cave' you think to yourself" ; line
  else "This should never be displayed" #BECAUSE OF MY PREVIOUS "UNTIL" LOOP, IF IT DISPALY THEN I MADE AN ERROR.
  end

  line ; sleep(3)
  puts "Continue..."
  continue

  #BEGINNING OF 2ND MAJOR DECISION, A MISTAKE CAN LEAD TO GAME OVER.
  puts "You pick yourself up and dust off your clothes, that mildew smell is really nauseating." ; line ; sleep(2)
  puts "The ground is covered with a small layer of moldy water,\nyou take a few steps forward and reach a fork in the road." ; line ; sleep(3)
  puts "continue..." ; line
  continue

  system("cls")
  puts "You: " ; sleep(1.5)
  puts  "- Go left" ; sleep(0.5)
  puts  "- Go right" ; sleep(0.5)
  decision_2 = gets_caps

  #FORCES DECISION LEFT OR RIGHT.
  until decision_2 == "Left" || decision_2 == "Right"
    system("cls")
    puts "You: " ; sleep(1)
    puts  "- Go left" ; sleep(0.3)
    puts  "- Go right" ; sleep(0.3)
    decision_2 = gets_caps
  end
  
  line

  case decision_2
  #PLAYER GOES LEFT, THEY HAVE THE OPTION TO OPEN A CHEST AND FIND A MAP OR IGNORE IT.
  when "Left"
    puts "You slowly advance down the passage to the left." ; sleep(2) ; line
    puts "As you walk along the path there seems to be a chest of sorts getting closer and closer!" ; sleep(3) ; line
    puts "You arrive at the chest along the wall." ; sleep(2) ; line
    puts "You: " ; sleep(1.5)
    puts "- 'Open' the chest" ; sleep(0.5)
    puts "- 'Ignore' the chest" ; sleep(0.5)
    decision_2a1 = gets_caps
    line

    #FORCES OPEN OR IGNORE
    until decision_2a1 == "Open" || decision_2a1 == "Ignore"
      system("cls")
      puts "You arrive at the chest along the wall." ; sleep(1) ; line
      puts "You: " ; sleep(1)
      puts  "- 'Open' the chest" ; sleep(0.3)
      puts  "- 'Ignore' the chest" ; sleep(0.3)
      decision_2a1 = gets_caps
    end

    #PLAYER DECIDES TO TAKE MAP OR IGNORE MAP.
    case decision_2a1
    when "Open"
      puts "You open the chest and find a map!." ; line ; sleep(2)
      %x{mspaint cave_map1.jpg}
      puts "You foolishly drop the map and lose it in the repulsive moldy soaked soil in the darkness..." ; sleep(5) ; line
      puts "Frustrated with no choice but to continue, you notice 2 more openings." ; sleep(3) ; line
      puts "You: " ; sleep(1.5)
      puts  "- 'Continue' straight" ; sleep(0.5)
      puts  "- 'Turn' right" ; sleep(0.5)
      decision_2a2 = gets_caps
      line

      #FORCES CONTINUE OR TURN
      until decision_2a2 == "Continue" || decision_2a2 == "Turn"
        system("cls")
        puts "Frustrated with no choice but to continue, you notice 2 more openings." ; sleep(1) ; line
        puts "You: " ; sleep(1)
        puts  "- 'Continue' straight" ; sleep(0.3)
        puts  "- 'Turn' right" ; sleep(0.3)
        decision_2a2 = gets_caps
      end

      #PLAYER CONTINUES DOWN CORRECT PATH TO PROGRESS.
      case decision_2a2
      when "Continue"
        puts "You continue straight until you reach a wall, thanks to the map you know to turn right now." ; sleep(2) ; line
        #GOOD PATH, LEFT --> OPEN --> CONTINUE --> END OF DECISION_2
        

      #PLAYER TURNS RIGHT, SAME AS INITIALLY TURNING RIGHT WHEN LEAVING SPAWN POINT, RESULTS IN GAME OVER.
      when "Turn"
        puts "You slowly advance down the darker passage to the right, praying this wasn't a mistake." ; sleep(3) ; line
        puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(3) ; line
        puts "You: " ; sleep(1.5)
        puts  "- Attempt to 'Fight' creature" ; sleep(0.5)
        puts  "- Attempt to 'Flee' from creature" ; sleep(0.5)
        decision_2b1 = gets_caps

        #FORCES FIGHT OR FLEE
        until decision_2b1 == "Fight" || decision_2b1 == "Flee"
          system("cls")
          puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(1.5) ; line
          puts "You: " ; sleep(1)
          puts  "- Attempt to 'Fight' creature" ; sleep(0.3)
          puts  "- Attempt to 'Flee' from creature" ; sleep(0.3)
          decision_2b1 = gets_caps
        end
      end # CASE DECISION_2A2 END

      line

      #DECISION BETWEEN FIGHT OR FLEE
      case decision_2b1
      when "Fight"
        puts "You attempt to fight back but the creature is too strong, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
        puts "Game over..." ; sleep(3)
        system("taskkill /f /im ruby.exe") #DEAD / END (START --> LEFT --> OPEN --> TURN --> FIGHT --> END)
      when "Flee"
        puts "You attempt to flee but the creature is too fast, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
        puts "Game over..." ; sleep(3)
        system("taskkill /f /im ruby.exe") #DEAD / END (START --> LEFT --> OPEN --> TURN --> FLEE --> END)
      end #CASE DECISION_2B1 END


      #PLAYER CHOOSES TO IGNORE MAP, DOES NOT GET POP-UP CAVE_MAP1. SAME OPTIONS AFTER AS IF HE GRABBED MAP, MINUS SOME DIALOGUE.
    when "Ignore"
      puts "You decide it's better to be safe than sorry." ; sleep(2) ; line
      puts "You notice 2 more openings." ; sleep(1) ; line
      puts "Continue..."
      continue
      system("cls")
      puts "You: " ; sleep(1.5)
      puts  "- 'Continue' straight" ; sleep(0.5)
      puts  "- 'Turn' right" ; sleep(0.5)
      decision_2a2 = gets_caps

      #FORCES PLAYER TO CONTINUE OR TURN, TURN RESULTS IN GAME OVER.
      until decision_2a2 == "Continue" || decision_2a2 == "Turn" || decision_2a2 == "Straight" || decision_2a2 == "Right"
        system("cls")
        puts "You notice 2 more openings." ; sleep(1) ; line
        puts "You: " ; sleep(1)
        puts  "- 'Continue' straight" ; sleep(0.3)
        puts  "- 'Turn' right" ; sleep(0.3)
        decision_2a2 = gets_caps
      end


      #THIS DECISION ALLOWS YOU TO PROGRESS THROUGH THE STORY TO THE NEXT MAP / LEVEL.
      case decision_2a2
      when "Continue" || "Straight"
        puts "You continue straight until you reach a wall." ; sleep(3) ; line
        puts "Left seems to loop back around so you decide to turn right." ; sleep(2) ; line #GOOD PATH, LEFT --> IGNORE --> CONTINUE --> END OF DECISION_2
        

      #THIS DECISION WILL RESULT IN GAME OVER, SAME AS INITIALLY TURNING RIGHT WHEN LEAVING SPAWN POINT.
      when "Turn" || "Right"
        puts "You slowly advance down the darker passage to the right, praying this wasn't a mistake." ; sleep(3) ; line
        puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(3) ; line
        puts "You: " ; sleep(1.5)
        puts  "- Attempt to 'Fight' creature" ; sleep(0.5)
        puts  "- Attempt to 'Flee' from creature" ; sleep(0.5)
        decision_2b1 = gets_caps

        #FORCES PLAYER TO FIGHT OR FLEE
        until decision_2b1 == "Fight" || decision_2b1 == "Flee"
          system("cls")
          puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(1.5) ; line
          puts "You: " ; sleep(1)
          puts  "- Attempt to 'Fight' creature" ; sleep(0.3)
          puts  "- Attempt to 'Flee' from creature" ; sleep(0.3)
          decision_2b1 = gets_caps
        end

        #PLAYER FIGHTS AND DIES
        case decision_2b1
        when "Fight"
          puts "You attempt to fight back but the creature is too strong, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
          puts "Game over..." ; sleep(3)
          system("taskkill /f /im ruby.exe") #DEAD / END (START --> LEFT --> IGNORE --> TURN --> FIGHT --> END)

        #PLAYER FLEES AND DIES
        when "Flee"
          puts "You attempt to flee but the creature is too fast, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
          puts "Game over..." ; sleep(3)
          system("taskkill /f /im ruby.exe") #DEAD / END (START --> LEFT --> IGNORE --> TURN --> FLEE --> END)
        end #CASE DECISION_2B1 END
      end #CASE DECISION_2A2 END
    end #CASE DECISION_2A1 END    



      
  #IF PLAYER GOES RIGHT, THEY WILL HAVE THE OPTION TO FIGHT OR FLEE, BUT BOTH WILL RESULT IN GAME OVER.    
  when "Right"
    puts "You slowly advance down the darker passage to the right, praying this wasn't a mistake." ; sleep(3) ; line
    puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(3) ; line
    Puts "You: " ; sleep(1.5)
    puts  "- Attempt to 'Fight' creature" ; sleep(0.5)
    puts  "- Attempt to 'Flee' from creature" ; sleep(0.5)
    decision_2b1 = gets_caps

    #FORCES FIGHT OR FLEE
    until decision_2b1 == "Fight" || decision_2b1 == "Flee"
      system("cls")
      puts "Suddenly you feel something GRABBING your arm abruptly and violently!" ; sleep(1.5) ; line
      puts "You: " ; sleep(1)
      puts  "- Attempt to 'Fight' creature" ; sleep(0.3)
      puts  "- Attempt to 'Flee' from creature" ; sleep(0.3)
      decision_2b1 = gets_caps
    end

    #GAME ENDS EITHER BY FIGHT OR FLEE
    case decision_2b1
    when "Fight"
      puts "You attempt to fight back but the creature is too strong, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
      puts "Game over..." ; sleep(3)
      system("taskkill /f /im ruby.exe") #DEAD (START --> RIGHT --> FIGHT --> END)
    when "Flee"
      puts "You attempt to flee but the creature is too fast, you slowly get sucked into the darkness, never to be heard of again." ; line ; sleep(3)
      puts "Game over..." ; sleep(3)
      system("taskkill /f /im ruby.exe") # DEAD (START --> RIGHT --> FLEE --> END)
    end
  end #CASE DECISION_2 END

  #END OF CAVE 1, LEADS TO CAVE 2. PLAYER FINDS MAP AND OPENS 2 PICTURES.
  puts "You continue along the path and see a light getting brighter and brighter" ; sleep(2) ; line 
  puts "Continue..."
  continue
  system("cls")
  puts "As you approach the opening in the wall, you see a map on the ground" ; sleep(3) ; line
  puts "'That could be useful' you think to yourself as you pick it up." ; sleep(3) ; line
  %x{mspaint cave_map2.jpg}

  system("cls")
  puts "The map showed another fork up ahead, but it didn't provide any other useful information." ; sleep(4) ; line
  puts "As you enter the opening, your eyes have fully adjusted to see the choice that lies before you." ; sleep(4) ; line
  puts "Continue"
  continue
  %x{mspaint cave.jpg}

  puts "That's all for now, thanks for play the demo :)"
  puts "Press enter to exit"
  continue



























#---------------------2 Player mode ---------------------
  #Greets both players and retrieves their name:
  when 2 then puts "Excellent, as the French say: Un c'est bon mais deux c'est mieux!"
    puts "Starting with the first adventurer, when we tell the tale of your courage and bravery, how should we refer to you?"
    player1 = gets_caps
    puts "#{player1}, truly a pleasure to have made your acquaintance. Now you, friend of #{player1}, what is your name?"
    player2 = gets_caps
    puts "Wonderful indeed! The heroic journey of #{player1} and #{player2} is about to begin!"

  #2 player mode: Gives the players the choice between 1 - 10 to guess their odds of winning the trials.
  puts "On a scale from 1 - 10, how likely do you think you'll survive these trials?"
  victory_odds = gets.chomp
  victory_odds = victory_odds.to_i
  until victory_odds > 0 && victory_odds <= 10
    puts "please enter a number between 1-10"
    victory_odds = gets.chomp
    victory_odds = victory_odds.to_i
  end

  case victory_odds
    when 1 then puts "One? Maybe you aren't the courageous warriors we've been waiting for..."
    when 2 then puts "Modest warriors at that, I'm sure you'll both do fine."
    when 3 then puts "Not the most confident of adventurers are you?"
    when 4 then puts "4, really? I was expecting a bit more from you both."
    when 5 then puts "You must be fully committed to survive these trials, a 5 won't get you very far."
    when 6 then puts "Ha! That's a start, but you'll need true conviction if you're to survive the trials."
    when 7 then puts "7 hmmm, that's not bad but in order to survive you'll need unwavering dedication!"
    when 8 then puts "Impressive young warriors, but even the dauntless find fear in these trials..."
    when 9 then puts "Do not falter! The difference between the confidence of a 9 and a 10 is who returns to share the tales of their glory, and who becomes an unfortuante fable for the next generation."
    when 10 then puts "Admirable! #{player1}, #{player2}, do me proud young warriors!"
  end
end
