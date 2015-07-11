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

def update_cand(i, candidates)
  candidates -= [candidates[i]]
  puts "New name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name)
    puts "That is not a valid name."
    puts "New name?"
    name = gets.chomp.downcase
  end
  name = name.capitalize

  new_cand_party
  party_select = gets.chomp.downcase
  until (party_select == "a" || party_select == "b")
    puts "That is not a valid entry."
    new_cand_party
    party_select = gets.chomp.downcase
  end
  if party_select == "a"
    party = "Republican"
  else
    party = "Democrat"
  end
  # require './classes.rb'
  candidates += [Candidate.new(name, party)]
end

def update_voter(j, voters)
  voters -= [voters[j]]
  puts "New name?"
  name = gets.chomp.downcase
  # write a check to make sure name is letters and spaces
  while (/[^a-z ]/===name)
    puts "That is not a valid name."
    puts "New name?"
    name = gets.chomp.downcase
  end
  name = name.capitalize

  new_voter_poli
  poli_select = gets.chomp.downcase
  until (poli_select == "a" || poli_select == "b" || poli_select == "c" || poli_select == "d" || poli_select == "e")
    puts "That is not a valid entry."
    new_voter_poli
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
  # require './classes.rb'
  voters += [Voter.new(name, politics)]
end

def update(candidates,voters)
  candidates = candidates
  voters = voters
  puts "Name?"
  old_name = gets.chomp.capitalize
  i=0
  j=0
  # search candidates for old_name
  while i < candidates.length
    if old_name == candidates[i].name
      index_for_change_cand = i
      p index_for_change_cand
    else
      index_for_change_cand = "none"
    end
    i += 1
  end
  # search voters for old_name
  p voters
  while j < voters.length
    if old_name == voters[j].name
      index_for_change_voter = j
      p index_for_change_voter
    else
      index_for_change_voter = "none"
    end
    j += 1
  end

  if index_for_change_cand == "none" && index_for_change_voter == "none"
    puts "That name is not currently on the list"
  elsif !(index_for_change_cand == "none") && index_for_change_voter == "none"
    candidates -= [candidates[i]]
    candidates = update_cand(i, candidates)
    puts "list cand"
    p candidates
  elsif index_for_change_cand == "none" && !(index_for_change_voter == "none")
    voters -= [voters[j]]
    voters = update_voter(j, voters)
    puts "list voters"
    p voters
  else
    clarification_question(old_name)
    clarification = gets.chomp.downcase
    until (clarification == "a" || clarification == "b")
      puts "That is not a valid entry."
      clarification_question(old_name)
      clarification = gets.chomp.downcase
    end
    if clarification == "a"
      voters -= [voters[j]]
      voters = update_voter(j, voters)
      puts "list voters"
      p voters
    else
      candidates -= [candidates[i]]
      candidates = update_cand(i, candidates)
      puts "list cand"
      p candidates
    end
  end
  p candidates
  p voters
  # candidates
  # voters
end
