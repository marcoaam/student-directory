class Dog
	def hairy?
		true
	end

	def has_fleas?
		false
	end

	def friendly_to?(animal)
		return false if animal == "cats"
		true
	end
end