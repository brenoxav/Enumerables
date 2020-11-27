require "./enumerables.rb"

describe Enumerable do

  let!(:arr) {[1, 2, 3, 4, 5]}
  let!(:hash) {{'one': 1, 'two': 2, 'three': 3}}

  describe "#my_each" do
    it "iterates through each value in an array" do
      i = 0
      arr.my_each do |e|
        expect(e).to eql(arr[i])
        i += 1
      end
    end

    it "iterates through each value in a hash" do
      hash.my_each do |k, v|
        expect(v).to eql(hash[k])
      end
    end

    it "returns an Enumerator if no block is given" do
      expect(arr.my_each.is_a? Enumerator).to be_truthy
    end
  end

  
end