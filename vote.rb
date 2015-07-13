

# require './classes.rb'
# require './list.rb'
#
def pick_vote(candidates,voters)
  voters.each do |v|
    v.vote = false
  end
  candidates.each do |c|
    c.votes = 1
  end
  voters += candidates
  candidates.each do |c|
    puts "\n#{c.name}'s stump speeches"
    sleep 0.5
    c.stump(voters)
    sleep 1
  end
  puts "\nTallying up the votes!"
  candidates.each do |c|
    puts "#{c.name} has #{c.votes} votes!"
  end
  winner = tally_votes(candidates)
  puts "\nThe winner#{winner}"

end


# pick_vote(Lists.candidates,Lists.voters)
