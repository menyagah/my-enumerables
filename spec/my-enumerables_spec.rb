require './enumerables'

describe Enumerable do
    describe '#my_each' do
        it "should return an enumerator object if block is not given" do
            obj = [1,2,4,5]
            expect(obj.my_each.class).to eql(Enumerator)
        end
        it "should return number of  key and a value pair in a hash if block is given" do
            obj = {man: 'Martin', age: 47}
            expect(obj.my_each {|k,v| p "#{k}, #{v}"}).to eql(2)
        end
        it "should return number of  array items in an array if block is given" do
            obj = [1,2,4,5]
            expect(obj.my_each {|n| p "n is : #{n}"}).to eql(4)
        end
        it "should return number of range items in an array if block is given" do
            obj = (1..10)
            expect(obj.my_each {|n| p "n is : #{n}"}).to eql(10)
        end
    end

    describe '#my_each_with_index' do
        it "should return an enumerator object if block is not given" do
            obj = [1,2,3,4,5]
            expect(obj.my_each_with_index.class).to eql(Enumerator)
        end
        it "should return number of  array items in an array if block is given" do
            obj = [1,2,3,4,5]
            expect(obj.my_each_with_index {|n| p "n is : #{n}"}).to eql(5)
        end
        it "should return number of  hash items in a hash if block is given" do
            obj = {gender: 'male', age: 27}
            expect(obj.my_each_with_index {|n, i| p "n is : #{n}, i is #{i}"}).to eql(2)
        end
        it "should return number of  range items in a given range if block is given" do
            obj = (1..10)
            expect(obj.my_each_with_index {|n| p "n is : #{n}"}).to eql(10)
        end
    end

    describe "#my_select" do
        it "should return an enumerator object if block is not given" do
            obj = [1,2,3,4,5]
            expect(obj.my_select.class).to eql(Enumerator)
        end
        it "should return an array containing all the elements that meet the given condition of the block" do
            obj = [1,2,3,4,5,6,7,8,9,10]
            expect(obj.my_select {|n| n.even?}).to eql([2,4,6,8,10])
        end
        it "should return a hash containing all the items that meet the given condition of the block if the block is given" do
            obj = {gender: 'male', age: 27, mark: 32}
            expect(obj.my_select {|n, i| i.is_a? Integer}).to eql({:age=>27, :mark=>32})
        end
        it "should return a range containing all the elements that meet the given condition of the block" do
            obj = (1..10)
            expect(obj.my_select {|n| n.even?}).to eql([2,4,6,8,10])
        end

    end

    describe "#my_all?" do
        it "should return true when none of the collection members are false or nil" do
            obj = [1,2,3,4,5,6,7,8,9,10]
            expect(obj.my_all? ).to eql(true)
        end
        it "should return true if the condition meets the block given, a Numeric" do
            obj = [1, 2i, 3.14]
            expect(obj.my_all?(Numeric)).to eql(true)
        end
        it "should return false since collection members are nil and false" do
            obj = [nil, true, 99]
            expect(obj.all?).to eql(false)
        end

    end


end
