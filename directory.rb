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
#print_header method just prints the header
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------"
end

#names method takes an array (which is an array multiple 2 element hashes) and prints each element of the array along with its index number
def names(students)
	students.each_with_index do |student, index|
		puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
	end
end

#print_names method prints the output of the names method
def print_names(students)
	puts "This is a list of all students in the database"
	names(students)
end

#only prints those elements of the students array that begin with an A
def print_names_begin_a(students)
	puts "This is a list of students whose names begin with an A"
	name_begin_a = students.select {|student| student[:name].start_with?('a'||'A')}

	if name_begin_a.empty?
		puts "-There are no students whose names begin with an 'A'"
	else
		names(name_begin_a)
	end	
end

#only prints those elements of the students array that have less than 12 characters
def print_length_less_12(students)
	puts "This is a list of students with less than 12 letters in their names"
	name_less_than_12_letters = students.select { |student| student[:name].length < 12 }
	
	if name_less_than_12_letters.empty?
		puts "-There are no students who have less than 12 letters in their name"
	else
		names(name_less_than_12_letters)
	end
end



#prints the total number of elements in the students array i.e. total number of students
def print_footer(students)
	puts "Overall, we have #{students.length} students in this cohort"
end


#This code calls the methods above
students = input_students
print_header
print_names(students)
print_names_begin_a(students)
print_length_less_12(students)
print_footer(students)