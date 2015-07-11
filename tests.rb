require './classes.rb'

def test_voter
  name = "Sandy"
  politics = "Progressive"
  v = Voter.new(name, politics)
  raise "Wrong name" unless v.name == name
  raise "Wrong politics" unless v.politics == politics
end

voter = test_voter

def test_candidate(voter)
  name = "Mike"
  party = "Republican"
  c = Candidate.new(name, party)
  raise "Wrong name" unless c.name == name
  raise "Wrong party" unless c.party == party
end

test_candidate(voter)

def test_campaign
#   c = Campaign.new voters, candidates
#
#   winner = c.winner
#   puts winner.name, winner.party
# end





# __END__


  voters = [
    Voter.new("Name1", "Progressive"),
    Voter.new("Name2", "Libertarian"),
    Voter.new("Name3", "Independent"),
    Voter.new("Name4", "Conservative"),
    Voter.new("Name5", "Massachusetts Democrat"),
  ]

  candidates = [
    Candidate.new("Cand1", "Republican"),
    Candidate.new("Cand2", "Republican"),
    Candidate.new("Cand3", "Democrat"),
    Candidate.new("Cand4", "Republican"),
    Candidate.new("Cand5", "Republican"),
    Candidate.new("Cand6", "Republican"),
  ]

  voters += candidates
  p voters

  candidates.each do |c|
    puts "\n#{c.name}'s stump speeches"
    c.stump(voters)
  end
  candidates.each do |c|
    puts "\n#{c.name} has #{c.votes} votes!"
  end
  winner = tally_votes(candidates)
  puts "\nThe winner#{winner}"
end
# winner = # The candidate with the most votes
test_campaign
