

# require './classes.rb'
# require './list.rb'
#
def pick_vote(candidates,voters)
  voters += candidates
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


# pick_vote(Lists.candidates,Lists.voters)
