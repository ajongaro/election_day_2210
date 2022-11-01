require './lib/candidate'

class Election
  attr_reader :year, :races

  def initialize(year)
    @year = year
    @races = []
  end

  def add_race(race)
    @races << race
  end
  
  def candidates
    @races.flat_map do |race|
      race.candidates
    end
  end

  def vote_counts
    vote_register = {}
    candidates.each do |candidate|
      vote_register[candidate.name] = candidate.votes
    end
    vote_register
  end
end

