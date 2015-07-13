# main menu file
# will contain a case block in which each different option will run a
# different method

def welcome
  puts <<-END
Welcome to the voting simulator!
Have fun!
  END
end

def main_menu
  puts <<-END

What would you like to do?
  (A)Create
  (B)List
  (C)Update
  (D)Vote
  END
end

def split_lists(list)

end

def to_continue
  puts <<-END

Do you want to continue with this set or exit the program?
  (A)Continue?
  (B)Exit program?
  END
end

def confirm
  puts <<-END

Are you sure you want to perform this action?
  (A)Yes
  (B)No
  END
end

candidates = []
voters = []

welcome
while true # to loop through entire program if user chooses to continue at end

  # puts main menu and makes sure answer is valid
  sleep 0.5
  main_menu
  choice = gets.chomp.downcase
  until (choice == "a" || choice == "b" || choice == "c" || choice == "d")
    puts "That is not a valid entry."
    main_menu
    choice = gets.chomp.downcase
  end

  # if user hasn't entered a candidate or voter, they shouldnt try to list, update, or vote
  if !(choice == "a") && voters == [] && candidates == []
      puts "\nYou should probably add a candidate or a voter first..."

  # if user hasnt included at least one candidate and at least one voter, they cant run a vote
  elsif choice == "d" && candidates == []
      puts "\nYou should probably add a candidate first..."
  elsif choice == "d" && voters == []
      puts "\nYou should probably add a voter first..."

  # actions based on valid calling of a main menu item
  else
    case choice
    when "a"
    # create a new person and add them to "candidates" list or "voters" list
      require './create.rb'
      new_person = create
      # p new_person
      if new_person.is_a? Candidate
        candidates << new_person
        puts "\n#{new_person.name}, the #{new_person.party} #{new_person.class} has been added!"
        # puts candidates # to check that list is updating
        # puts voters # to check that list is updating
      else
        voters << new_person
        puts "\n#{new_person.name}, the #{new_person.politics} #{new_person.class} has been added!"
        # puts voters # to check that list is updating
      end

    when "c"
    # run the update function with candidates list and voters list as arguments,
    # should return both lists back separately
      require './update.rb'
      list = update(candidates,voters)
    when "b"
      # call the entries in the candidates and voters lists
      # list = candidates + voters
      # list.each do |c|
      #   require './classes.rb'
      #   if c.is_a? Candidate
      #     puts "#{c.class}, #{c.name}, #{c.party}"
      #   else
      #     puts "#{c.class}, #{c.name}, #{c.politics}"
      #   end
      # end
      list = candidates + voters
      require './classes.rb'
      puts "\n"
      candidates.each do |c|
        puts "#{c.class}, #{c.name}, #{c.party}"
      end
      voters.each do |v|
        puts "#{v.class}, #{v.name}, #{v.politics}"
      end

    when "d"
      require './vote.rb'
      pick_vote(candidates,voters)
    end
  end

  # check if user wants to continue with current lists or exit program
  to_continue
  continue = gets.chomp.downcase
  until (continue == "a" || continue == "b")
    puts "\nThat is not a valid entry."
    sleep 0.5
    to_continue
    continue = gets.chomp.downcase
  end
  if continue == "a"
    puts "\nThen let's continue."
  else
    confirm
    confirmation = gets.chomp.downcase
    until (confirmation == "a" || confirmation == "b")
      puts "\nThat is not a valid entry."
      sleep 0.5
      confirm
      confirmation = gets.chomp.downcase
    end
    if confirmation == "a"
      break
    else
      puts "\nGlad we caught that! Let's continue"
    end
  end
end
