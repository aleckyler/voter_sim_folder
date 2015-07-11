def create_main
  puts <<-END
What would you like to create?
  (A)Candidate
  (B)Voter
  END
end

def cand_party
  puts <<-END
Party?
  (A)Republican
  (B)Democrat
  END
end

def voter_poli
  puts <<-END
Politics?
  (A)Progressive
  (B)Conservative
  (C)Libertarian
  (D)Massachusetts Democrat
  (E)Independent
  END
end

def create_candidate
  puts "Name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name)
    puts "That is not a valid name."
    puts "Name?"
    name = gets.chomp.downcase
  end
  name = name.capitalize

  cand_party
  party_select = gets.chomp.downcase
  until (party_select == "a" || party_select == "b")
    puts "That is not a valid entry."
    cand_party
    party_select = gets.chomp.downcase
  end
  if party_select == "a"
    party = "Republican"
  else
    party = "Democrat"
  end
  require './classes.rb'
  c = Candidate.new(name, party)
end

def create_voter
  puts "Name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name)
    puts "That is not a valid name."
    puts "Name?"
    name = gets.chomp.downcase
  end
  name = name.capitalize

  voter_poli
  poli_select = gets.chomp.downcase
  until (poli_select == "a" || poli_select == "b" || poli_select == "c" || poli_select == "d" || poli_select == "e")
    puts "That is not a valid entry."
    voter_poli
    poli_select = gets.chomp.downcase
  end
  case poli_select
  when "a"
    politics = "Progressive"
  when "b"
    politics = "Conservative"
  when "c"
    politics = "Libertarian"
  when "d"
    politics = "Massachusetts Democrat"
  else
    politics = "Independent"
  end
  require './classes.rb'
  c = Voter.new(name, politics)
end

def create
#   puts <<-END
# What would you like to create?
#   (A)Candidate
#   (B)Voter
#   END
  create_main
  choice = gets.chomp.downcase
  until (choice == "a" || choice == "b")
    puts "That is not a valid entry."
    create_main
    choice = gets.chomp.downcase
  end
  if choice == "a"
    c = create_candidate

    puts c.name
    puts c.party
    puts c.class
  else
    c = create_voter
  end
  c
end
