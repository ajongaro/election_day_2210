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
    
    it 'returns false when race has been closed' do
      expect(race.open?).to be true

      race.close!
      expect(race.open?).to be false
    end
  end
end