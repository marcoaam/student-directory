# This code is an array of the students in the June cohort at MA
=begin
students = [
	{:name => "Dave", :cohort => :june},
	{:name => "Eddie", :cohort => :june},
	{:name => "Catharina", :cohort => :june},
	{:name => "Igor", :cohort => :june},
	{:name => "Marco", :cohort => :june},
	{:name => "Lisa", :cohort => :june},
	{:name => "Michiel", :cohort => :june},
	{:name => "Jean", :cohort => :june},
	{:name => "Nicola", :cohort => :june},
	{:name => "Jennie", :cohort => :june},
	{:name => "Iona", :cohort => :june},
	{:name => "Nikesh", :cohort => :june},
	{:name => "Chloe", :cohort => :june},
	{:name => "Toan", :cohort => :june},
	{:name => "Jamie", :cohort => :june},
	{:name => "Peter", :cohort => :june},
	{:name => "Talal", :cohort => :june},
	{:name => "Charlie", :cohort => :june},
	{:name => "Charlotte", :cohort => :june},
	{:name => "Thomas", :cohort => :june},
	{:name => "Zoe", :cohort => :june},
	{:name => "Hannah", :cohort => :june},
	{:name => "Joe", :cohort => :june},
	{:name => "Alex", :cohort => :june},
	{:name => "Jeremy", :cohort => :june}
]
=end

#Hash Input methods
def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	# Empty array creation
	students = []
	#Get the 1st name
	name = gets.chomp
	#While name is not empty, repeat this
	while !name.empty? do
		#add the student hash to the array
		students << {:name => name, :cohort => :june}
		puts "Now we have #{students.length} students"
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end
#This section defines the  methods
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------"
end

def print_names(students)
	puts "This is the indexed list of all students in the directory"
	students.each_with_index do |student, index|
		puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} students in this cohort"
end

def print_names_begin_a(names_a)
	puts "This is the indexed list of students whose names begin with an A"
	names_a.each_with_index do |student, index|
		if student[:name].start_with?("a" || "A")
			puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
		end

	end
end

def print_length_less_12(names_12)
	puts "This is the index list of students with less than 12 letters in their names"
	names_12.each_with_index do |student, index|
		if student[:name].length < 12
			puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
		end

	end
end

def print_length_less_12_trial(names_12)
	puts "This is the index list of students with less than 12 letters in their names"
	names_12.each_with_index do |student, index|
		when student[:name].length < 12 then puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
		else puts "No names less than 12"
		end

	end
end



#This code calls the methods above
students = input_students
print_header
print_names(students)
print_names_begin_a(students)
print_length_less_12(students)
print_length_less_12_trial(students)
print_footer(students)