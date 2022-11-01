require './lib/candidate'

RSpec.describe Candidate do
  let(:diana) { Candidate.new({name: "Diana D", party: :democrat}) }
  describe '#initialize' do
    it 'exists' do
      expect(diana).to be_a(Candidate)
      expect(diana.name).to eq("Diana D")
      expect(diana.party).to eq(:democrat)
      expect(diana.votes).to eq(0)
    end
  end

  describe '#vote_for!' do
    it 'adds to the votes tally' do
      expect(diana.votes).to eq(0)

      diana.vote_for!
      expect(diana.votes).to eq(1)

      diana.vote_for!
      expect(diana.votes).to eq(2)
    end
  end
end