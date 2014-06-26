require 'dog'

describe Dog do	
	it 'is hairy' do
		fido = Dog.new
		expect(fido).to be_hairy
	end

	it 'has no fleas' do
		fido = Dog.new
		expect(fido).not_to have_fleas
	end

	it 'is unfriendly to cats' do
		fido = Dog.new
		expect(fido).not_to be_friendly_to("cats")
	end

	it 'is friendly to everything else' do
		fido = Dog.new
		expect(fido).to be_friendly_to("humans")
	end
end