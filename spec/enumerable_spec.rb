require './enumerables'

describe Enumerable do
  let!(:arr) { [1, 2, 3, 4, 5] }
  let!(:hash) { { 'one': 'uno', 'two': 'dos', 'three': 'tres' } }

  describe '#my_each' do
    it 'iterates through each value in an array' do
      i = 0
      arr.my_each do |e|
        expect(e).to eql(arr[i])
        i += 1
      end
    end

    it 'iterates through each value in a hash' do
      hash.my_each do |k, v|
        expect(v).to eql(hash[k])
      end
    end

    it 'returns an Enumerator if no block is given' do
      expect(arr.my_each.is_a?(Enumerator)).to be_truthy
    end
  end

  describe '#my_each_with_index' do
    it 'iterates through each value and index in an array' do
      i = 0
      arr.my_each_with_index do |_e, index|
        expect(index).to eql(i)
        i += 1
      end
    end

    it 'returns the enumerable being called' do
      expect(arr.my_each_with_index {}).to eql(arr)
    end
  end

  describe '#my_select' do
    it 'returns an array containing all elements of enum for which the given block returns a true value ' do
      expect(arr.my_select(&:even?)).to eql([2, 4])
    end

    it 'If no block is given, an Enumerator is returned' do
      expect(arr.my_select.is_a?(Enumerator)).to be_truthy
    end

    it 'returns a hash with matching values' do
      expect(hash.my_select { |k, v| v == 'dos' }).to eql([[:two, 'dos']])
    end
  end

  describe '#my_all?' do
    it 'returns true if the block never returns false or nil' do
      expect(arr.my_all? { |e| e.is_a? Numeric }).to be_truthy
    end

    it 'returns whether pattern === element for every collection member' do
      expect(hash.my_all?(/o/)).to be_falsy
    end

    it 'returns false if any of the elements is false or nil' do
      expect([1, 2, nil, 4].my_all?).to be_falsy
    end
  end

  describe '#my_any?' do
    it 'returns true if the block ever returns true' do
      expect(arr.my_any? { |e| e.is_a? Numeric }).to be_truthy
    end

    it 'returns whether pattern === element for any collection member' do
      expect(hash.my_any?(/o/)).to be_truthy
    end

    it 'returns false if all of the elements are false or nil' do
      expect([false, false, nil].my_any?).to be_falsy
    end
  end

  describe '#my_none?' do
    it 'returns true if the block never returns true' do
      expect([nil, false].none?).to be_truthy  
    end
  end

    it 'returns whether pattern === element for any collection member' do
      expect(%w{ant bear cat}.none?(/d/)).to be_truthy
    end

  it 'returns true if all of the elements are false or nil' do
    expect([false, false, nil].my_none?).to be_truthy
  end

  
end
