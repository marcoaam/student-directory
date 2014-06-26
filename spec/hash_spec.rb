describe Hash do

	#This is a global hash variable declaration
	let(:hash) {{name: "Marco", cohort: "June"}}
	
	it "is empty" do
	expect(hash).not_to be_empty
	end

	it "to clear the hash" do
		expect(hash.clear).to be_empty
	end

	it "hash the value provided as a parameter" do
		expect(hash).to have_value("Marco")
	end

	it "Returns true if the key is included" do
		expect(hash.include?(:name)).to eq true
	end

	it "Returns true if it has the key provided" do
		expect(hash.key?(:name)).to eq true
	end

	it "Returns a new array with just the keys from the hash" do
		expect(hash.keys).to eq ([:name, :cohort])
	end

	it "Returns a new hash without the provided value" do
		expect(hash.delete(:name)).to eq ("Marco")
	end

	it "Returns the length of the element in pairs" do
		expect(hash.length).to eq (2)
	end

	
end

