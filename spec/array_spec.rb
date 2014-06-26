#require 'name of the file'

describe Array do
	it 'is empty' do
		array = []
		expect(array).to be_empty
		#expect(array.empty?).to be_true
	end

	it 'is not empty' do
		expect([1]).not_to be_empty
	end

	it 'multiplies elements together with inject' do
		expect([1,2,3,4].inject{ |acc , number| acc * number}).to eq 24
	end
end