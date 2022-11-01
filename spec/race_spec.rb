require './lib/race'

RSpec.describe Race do
  let(:race) { Race.new("Texas Governor") }

  describe '#initialize' do
    it 'exists' do
      expect(race).to be_a(Race)
      expect(race.office).to eq("Texas Governor")
      expect(race.candidates).to eq([])
    end
  end
  
  describe '#register_candidate!' do
    it 'registers a candidate in the race' do
      race.register_candidate!( {name: "Diana D", party: :democrat} )
      race.register_candidate!( {name: "Roberto R", party: :republican} )

      expect(race.candidates[0].name).to eq("Diana D")
      expect(race.candidates[1].name).to eq("Roberto R")
    end
  end

  describe '#open? & close!' do
    it 'returns true by default' do
      expect(race.open?).to be true
    end
    
    it 'can make a race no longer open' do
      expect(race.open?).to be true

      race.close!
      expect(race.open?).to be false
    end
  end

  describe '#winner' do
    it 'returns false when race is open' do
      expect(race.winner).to be false
    end

    it 'returns a winner when race is closed' do
      expect(race.winner).to be false
      race.register_candidate!( {name: "Diana D", party: :democrat} )
      race.register_candidate!( {name: "Roberto R", party: :republican} )
      race.register_candidate!( {name: "Diego D", party: :democrat} )

      4.times {race.candidates[0].vote_for!}
      1.times {race.candidates[1].vote_for!}
      10.times {race.candidates[2].vote_for!}
      
      race.close!

      expect(race.winner).to eq(race.candidates[2])
    end

    it 'is a tie if multiple winners' do
      expect(race.tie?).to be false
      race.register_candidate!( {name: "Diana D", party: :democrat} )
      race.register_candidate!( {name: "Roberto R", party: :republican} )
      race.register_candidate!( {name: "Diego D", party: :democrat} )

      4.times {race.candidates[0].vote_for!}
      10.times {race.candidates[1].vote_for!}
      10.times {race.candidates[2].vote_for!}
      
      race.close!

      # expect(race.tie?).to be true 
    end
  end
end