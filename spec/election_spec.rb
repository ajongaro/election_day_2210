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
      election.add_race(race1)
      election.add_race(race2)

      race1.register_candidate!( {name: "Diana D", party: :democrat} )
      race1.register_candidate!( {name: "Roberto R", party: :republican} )
      race2.register_candidate!( {name: "Diego D", party: :democrat} )
      race2.register_candidate!( {name: "Rita R", party: :republican} )
      race2.register_candidate!( {name: "Ida I", party: :independent} )

      4.times {election.candidates[0].vote_for!}
      1.times {election.candidates[1].vote_for!}
      10.times {election.candidates[2].vote_for!}
      6.times {election.candidates[3].vote_for!}
      6.times {election.candidates[4].vote_for!}

      expect(election.candidates.count).to eq(5)
      expect(election.vote_counts).to eq({"Diana D"=>4, "Roberto R"=>1, "Diego D"=>10, "Rita R"=>6, "Ida I"=>6})
    end
  end
end