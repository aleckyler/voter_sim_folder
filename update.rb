require './classes.rb'
def clarification_question(old_name)
  puts <<-END

"Did you mean #{old_name} the voter or #{old_name} the candidate?"
(A)Voter
(B)Candidate
  END
end

def new_cand_party
  puts <<-END

New Party?
  (A)Republican
  (B)Democrat
  END
end

def new_voter_poli
  puts <<-END

New Politics?
  (A)Progressive
  (B)Conservative
  (C)Libertarian
  (D)Massachusetts Democrat
  (E)Independent
  END
end

def update_cand(index_for_change_cand, candidates, old_name)
  # candidates -= [candidates[i]]
  # i=i
  # candidates = candidates
  # p candidates
  # p index_for_change_cand
  # p candidates[index_for_change_cand]
  puts "\nNew name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name) || name.length == 0
    puts "\nThat is not a valid name."
    puts "\nNew name?"
    name = gets.chomp.downcase
  end
  candidates[index_for_change_cand].change_name(name.capitalize)

  new_cand_party
  party_select = gets.chomp.downcase
  until (party_select == "a" || party_select == "b")
    puts "\nThat is not a valid entry."
    new_cand_party
    party_select = gets.chomp.downcase
  end
  if party_select == "a"
    candidates[index_for_change_cand].party = "Republican"
  else
    candidates[index_for_change_cand].party = "Democrat"
  end

  puts "\nYou have changed the candidate #{old_name} to #{candidates[index_for_change_cand].name}, the #{candidates[index_for_change_cand].party} candidate!"
  # require './classes.rb'
  # candidates += [Candidate.new(name, party)]
end

def update_voter(index_for_change_voter, voters, old_name)
  # voters -= [voters[j]]
  puts "\nNew name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name) || name.length == 0
    puts "\nThat is not a valid name."
    puts "\nNew name?"
    name = gets.chomp.downcase
  end
  voters[index_for_change_voter].name = name.capitalize

  new_voter_poli
  poli_select = gets.chomp.downcase
  until (poli_select == "a" || poli_select == "b" || poli_select == "c" || poli_select == "d" || poli_select == "e")
    puts "\nThat is not a valid entry."
    new_voter_poli
    poli_select = gets.chomp.downcase
  end
  case poli_select
  when "a"
    voters[index_for_change_voter].politics = "Progressive"
  when "b"
    voters[index_for_change_voter].politics = "Conservative"
  when "c"
    voters[index_for_change_voter].politics = "Libertarian"
  when "d"
    voters[index_for_change_voter].politics = "Massachusetts Democrat"
  else
    voters[index_for_change_voter].politics = "Independent"
  end

puts "\nYou have changed the voter #{old_name} to #{voters[index_for_change_voter].name}, the #{voters[index_for_change_voter].politics} voter!"
  # require './classes.rb'
  # voters += [Voter.new(name, politics)]
end

def update(candidates,voters)
  candidates = candidates
  voters = voters
  puts "\nName?"
  old_name = gets.chomp.capitalize
  i=0
  j=0
  index_for_change_cand = "none"
  # search candidates for old_name
  while i < candidates.length
  # p old_name
  # p candidates[i].name
    if candidates.length == 0
      index_for_change_voter = nil
    elsif old_name == candidates[i].name
      index_for_change_cand = i
    end
    i += 1
  end
  # candidates.each do |x|
  #   if x.name == old_name
  #
  # end

  # p index_for_change_cand
  # search voters for old_name
  # p voters
  index_for_change_voter = "none"
  while j < voters.length
    if voters.length == 0
      index_for_change_voter = nil
    elsif old_name == voters[j].name
      index_for_change_voter = j
    end
    j += 1
  end
    # p index_for_change_voter

  if index_for_change_cand == "none" && index_for_change_voter == "none"
    puts "\nThat name is not currently on the list"
  elsif !(index_for_change_cand == "none") && index_for_change_voter == "none"
    # candidates -= [candidates[i]]
    candidates = update_cand(index_for_change_cand, candidates, old_name)
    # puts "list cand"
    # p candidates
  elsif index_for_change_cand == "none" && !(index_for_change_voter == "none")
    # voters -= [voters[j]]
    voters = update_voter(index_for_change_voter, voters, old_name)
    # puts "list voters"
    # p voters
  else
    clarification_question(old_name)
    clarification = gets.chomp.downcase
    until (clarification == "a" || clarification == "b")
      puts "\nThat is not a valid entry."
      clarification_question(old_name)
      clarification = gets.chomp.downcase
    end
    if clarification == "a"
      # voters -= [voters[j]]
      voters = update_voter(index_for_change_voter, voters, old_name)
      # puts "list voters"
      # p voters
    else
      # candidates -= [candidates[i]]
      candidates = update_cand(index_for_change_cand, candidates, old_name)
      # puts "list cand"
      # p candidates
    end
  end
  # p candidates
  # p voters
  # # candidates
  # voters
end
