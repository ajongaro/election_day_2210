require './lib/candidate'
class Race
  attr_reader :office, :candidates

  def initialize(office)
    @office = office
    @candidates = []
    @open = true
  end

  def register_candidate!(candidate)
    @candidates << Candidate.new(candidate)
  end

  def open?
    @open
  end

  def close!
    @open = false
  end

  def vote_counts
    ballot_box = {}
    @candidates.each do |candidate|
      ballot_box[candidate.name] = candidate.votes
    end
    ballot_box
  end

  def winner
    return false if open?
    high_count = vote_counts.max_by do |name, votes|
      votes
    end

    @candidates.select do |candidate|
      candidate.name == high_count[0]
    end.first
  end

  def tie?
    return false if open?
  end
end
