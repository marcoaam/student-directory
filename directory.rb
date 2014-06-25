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


#print_header method just prints the header
def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-----------------"
end

#Hash Input method
def input_students
  puts "Please enter the name of the first student"
  puts "To go back to the Main menu, just hit return without entering any name"
  # Empty array creation
  students = []
  #Get the 1st name
  name = gets.chomp
  #While name is not empty, repeat this
  while !name.empty? do
    #Gets month
    puts "Enter the month"
    month = gets.chomp.downcase.to_sym
    if month.empty?
      month = :june
    end
    #Gets their hobbies
    puts "Enter their hobbies"
    hobbies = gets.chomp
    #add the student hash to the array
    students << {:name => name, :cohort => month, :hobbies => hobbies}
    puts students.length <= 1 ? "Now we have #{students.length} student" : "Now we have #{students.length} students"
    #get another name from the user
    puts "Enter the name of the next student or press return to go back to the Main menu"
    name = gets.chomp
  end
  #returns the array of students
  students
end

#names method takes an array (which is an array multiple 2 element hashes) and prints each element of the array along with its index number
def names(students)
  if !students.empty? 
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} - #{student[:cohort]} cohort, hobbies: #{student[:hobbies]}"
    end
  else
    puts "no students"
  end
end

#This is the method that sorts the students by cohort
def names_by_cohort(students)
  students.sort_by { |student| student[:cohort] }
end

#only prints those elements of the students array that begin with an A
def print_names_begin_a(students)
  puts "\nThis is a list of students whose names begin with an A"
  name_begin_a = students.select {|student| student[:name].start_with?('a'||'A')}
#This code tests if is empty
  if name_begin_a.empty?
    puts "-There are no students whose names begin with an 'A'"
  else
    names(name_begin_a)
  end 
end

#only prints those elements of the students array that have less than 12 characters
def print_length_less_12(students)
  puts "\nThis is a list of students with less than 12 letters in their names"
  name_less_than_12_letters = students.select { |student| student[:name].length < 12 }
  
  if name_less_than_12_letters.empty?
    puts "-There are no students who have less than 12 letters in their name"
  else
    names(name_less_than_12_letters)
  end
end



#prints the total number of elements in the students array i.e. total number of students
def print_footer(students)
  puts students.length <= 1 ? "\nOverall, we have #{students.length} student in this cohort" : "\nOverall, we have #{students.length} students in all cohorts"
end

#This method holds the main menu that calls all the methods selected by the user
def interactive_menu(students)

  loop do
    puts ""
    puts "-------Main menu-------".center(50)
    puts "1. Add Students"
    puts "2. Show all students"
    puts "3. Show all the students that their names starts with an 'A'"
    puts "4. Show all the students that their names have less than 12 characters"
    puts "5. Show the students grouped by cohort"
    puts "9. Exit"
    selection = gets.chomp
    case selection
      when "1"
        students = input_students
      when "2"
        puts "\nThis is a list of all students in the database"
        names(students)
      when "3"
        print_names_begin_a(students)
      when "4"
        print_length_less_12(students)
      when "5"
        puts "\nThis is the student database sorted by cohort month"
        sorted_students = names_by_cohort(students)
        names(sorted_students)
      when "9"
        exit
      else
        "Invalid selection"
      end
    end
end

#Declaration
students = [
  {:name => "Alex", :cohort => :june},
  {:name => "Jeremy", :cohort => :june}
]

#This code calls the methods above
#students = input_students
interactive_menu(students)
#print_header
#print_names(students)
#print_names_begin_a(students)
#print_length_less_12(students)
#names_by_cohort(students)
#print_footer(students)