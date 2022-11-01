require './lib/election'

RSpec.describe Election do
  let(:election) { Election.new("2022") }
  let(:race1) { Race.new("Texas Governor") }
  let(:race2) { Race.new("Viriginia District 4 Representative") }

  describe '#initialize' do
    it 'exists' do
      expect(election).to be_a(Election)
      expect(election.year).to eq("2022")
      expect(election.races).to eq([])
    end
  end
  
  describe '#add_race' do
    it 'adds a race to the election' do
      election.add_race(race1)
      expect(election.races).to eq([race1])

      election.add_race(race2)
      expect(election.races).to eq([race1, race2])
    end
  end
  
  describe '#vote_counts' do
    it 'counts all the votes as a hash' do
      # add stuff here
    end
  end
end