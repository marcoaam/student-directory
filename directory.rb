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
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} students in this cohort"
end

#This code calls the methods above
students = input_students
print_header
print_names(students)
print_footer(students)