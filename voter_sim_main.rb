# main menu file
# will contain a case block in which each different option will run a
# different method



def main_menu
  puts <<-END
What would you like to do?
  (A)Create
  (B)List
  (C)Update
  (D)Vote
  END
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
# def check_response(question, valid_responses, choice)
#   until valid_responses.include? choice
#     puts "That is not a valid entry."
#     question
#     choice = gets.chomp.downcase
#   end
# end

candidates = []
voters = []

while true
  main_menu
  choice = gets.chomp.downcase
  # valid_responses = ["a", "b", "c", "d"]
  # check_response(main_menu, valid_responses, choice)
  until (choice == "b" || choice == "a" || choice == "c" || choice == "d")
    puts "That is not a valid entry."
    main_menu
    choice = gets.chomp.downcase
  end

  if !(choice == "a") && voters == [] && candidates == []
      puts "You should probably add a candidate or a voter first..."
  elsif choice == "d" && candidates == []
      puts "You should probably add a candidate first..."
  elsif choice == "d" && voters == []
      puts "You should probably add a voter first..."

  else
    case choice
    when "a"
      require './create.rb'
      new_person = create
      p new_person
      if new_person.is_a? Candidate
        candidates += [new_person]
        puts "#{new_person.name}, the #{new_person.party} #{new_person.class} has been added!"
        puts candidates # to check that list is updating
        puts voters # to check that list is updating
      else
        voters += [new_person]
        puts "#{new_person.name}, the #{new_person.politics} #{new_person.class} has been added!"
        puts voters # to check that list is updating
      end


    when "c"
      require './update.rb'
      (candidates,voters)=update(candidates,voters)
    when "b"
      # call the entries in the candidates and voters lists
      list = candidates + voters
      list.each do |c|
        require './classes.rb'
        if c.is_a? Candidate
          puts "#{c.class}, #{c.name}, #{c.party}"
        else
          puts "#{c.class}, #{c.name}, #{c.politics}"
        end
      end
    when "d"
      require './vote.rb'
      pick_vote(candidates,voters)
    end
  end

  to_continue
  continue = gets.chomp.downcase
  until (continue == "a" || continue == "b")
    puts "That is not a valid entry."
    to_continue
    continue = gets.chomp.downcase
  end
  if continue == "a"
    puts "Then let's continue."
  else
    confirm
    confirmation = gets.chomp.downcase
    until (confirmation == "a" || confirmation == "b")
      puts "That is not a valid entry."
      confirm
      confirmation = gets.chomp.downcase
    end
    if confirmation == "a"
      break
    else
      puts "Glad we caught that! Let's continue"
    end
  end
end
