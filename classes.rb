class Voter
  attr_accessor :politics, :name, :vote

  def initialize(name, politics)
    @name = name
    @politics = politics
    @vote = false
  end

  def stump_result(threshold, candidate)
    if @chance < threshold
      puts "#{self.name}: I think I will vote for #{candidate.name}"
      @vote = candidate.name # set the candidate's vote
      candidate.votes +=1
    else
      puts "#{self.name}: I am still unsure of my vote."
    end
  end

  def listen(candidate)
    @chance = rand(1..100)
    if candidate == self
      puts "#{self.name}: I don't need to give myself a speech"
    elsif self.is_a? Candidate # if the voter is a candidate, auto response "I'm still voting for myself"
      puts "#{self.name}: I'm still going to vote for myself"
      @vote = self.name
    elsif @vote
      puts "#{self.name}: I am already voting for #{vote}"
    else
      if candidate.party == "Republican"
        case self.politics# run percents based on voter's politics if candidate is republican
        when "Tea Party"
          stump_result(90, candidate)
        when "Conservative"
          stump_result(75, candidate)
        when "Independent"
          stump_result(50, candidate)
        when "Progressive"
          stump_result(25, candidate)
        else
          stump_result(10, candidate)
        end
      else
        case self.politics# run percents based on voter's politics if candidate is democrat
        when "Massachusetts democrat"
          stump_result(90, candidate)
        when "Progressive"
          stump_result(75, candidate)
        when "Independent"
          stump_result(50, candidate)
        when "Conservative"
          stump_result(25, candidate)
        else
          stump_result(10, candidate)
        end
      end
    end
  end
end

class Candidate < Voter
  attr_accessor :party, :votes, :name

  def initialize(name, party)
    @name = name
    @party = party
    @votes = 1
  end

  def change_name(new_name)
    @name = new_name
  end

  def politics
    if party == "Republican"
      "Conservative"
    else
      "Progressive"
    end
  end

  def stump(voters)
    voters.each do |v|
      v.listen(self)
      sleep 1
    end
  end
end

def tally_votes(candidates)
  i=1
  max = candidates[0].votes
  winner = " is #{candidates[0].name} with #{max} votes!"
  while i < candidates.length
    a= max<=>candidates[i].votes
    if a === -1
      max=candidates[i].votes
      winner=" is #{candidates[i].name} with #{max} votes!"
    elsif a === 0
      winner.gsub!("s are","s are #{candidates[i].name} and")
      winner.gsub!(" is","s are #{candidates[i].name} and")
    end
    i+=1
    # p winner
  end
  winner
end
