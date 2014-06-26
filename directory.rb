

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
  puts "To go back to the Main menu, just hit return without entering any name"
  #Get the 1st name
  name = ask_for("name")
  get_student_details(name)
end

def ask_for(detail)
  puts "Enter your #{detail}"
  gets.chomp  
end

def get_student_details(name)
  while !name.empty? do
    #Gets month
    month = ask_for("month")
    month = :june if month.empty?
    #Gets their hobbies
    hobbies = ask_for("hobbies")
    #add the student hash to the array
    add_student({:name => name, :cohort => month.downcase.to_sym, :hobbies => hobbies})
    #get another name from the user
    name = ask_for("name")
  end
end

def pluralize?
  @students.length > 1
end

def pluralize(word)
  return word + "s" if pluralize?
  word
end

# def number_of_students
#   if pluralize?
#     "Now we have #{@students.length} students"
#   else 
#     "Now we have #{@students.length} student"
#   end
# end

#names method takes an array (which is an array multiple 2 element hashes) and prints each element of the array along with its index number
def print_line(student, index)
  "#{index}. #{student[:name]} - #{student[:cohort]} cohort, hobbies: #{student[:hobbies]}"
end

def print_student_list(list_of_students)
  list_of_students.map.with_index(1) { |student, index| print_line(student, index) }
end

def print_names(list_of_students)
  puts !list_of_students.empty? ?  print_student_list(list_of_students) : "no students"
end

#This is the method that sorts the students by cohort
def names_by_cohort
  @students.sort_by { |student| student[:cohort] }
end

#only prints those elements of the students array that begin with an A
def print_names_begins_with(letter)
  name_begin_with = @students.select {|student| student[:name].start_with?(letter, letter.upcase)}
#This code tests if is empty
  if name_begin_with.empty?
    puts "-There are no students whose names begin with an 'A'"
  else
    print_names(name_begin_with)
  end
end

#only prints those elements of the students array that have less than 12 characters
def print_length_less_12
  name_less_than_12_letters = @students.select { |student| student[:name].length < 12 }
  if name_less_than_12_letters.empty?
    puts "-There are no students who have less than 12 letters in their name"
  else
    print_names(name_less_than_12_letters)
  end
end

#prints the total number of elements in the students array i.e. total number of students
def print_footer
  puts "\nOverall, we have #{@students.length} #{pluralize("student")} in all cohorts"

  # if pluralize?
  #   puts "\nOverall, we have #{@students.length} students in all cohorts"
  # else
  #   puts "\nOverall, we don't have #{@students.length} any student in the directory"
  # end
end

def print_menu_options
    puts ""
    puts "-------Main menu-------".center(50)
    puts "1. Add Students"
    puts "2. Show all students"
    puts "3. Show all the students that their names starts with an 'A'"
    puts "4. Show all the students that their names have less than 12 characters"
    puts "5. Show the students grouped by cohort"
    puts "6. Save the students in a file"
    puts "7. Load students from the file"
    puts "8. Update student information"
    puts "9. Exit"
end


#This method 
def interactive_menu
  puts ""
  puts "-----Student Directory Program-----".center(50)
  loop do
    print_menu_options
    selection = gets.chomp
    menu_options(selection)
  end
end

def menu_options(selection)
     case selection
    when "1"
      input_students
    when "2"
      puts "\nThis is a list of all students in the Student Directory"
      print_names(@students)
      print_footer
    when "3"
      puts "\nThis is a list of students whose names begin with 'A'"
      print_names_begins_with('a')
    when "4"
      puts "\nThis is a list of students with less than 12 letters in their names"
      print_length_less_12
    when "5"
      puts "\nThis is the Student Directory grouped by cohort month"
      sorted_students = names_by_cohort
      print_names(sorted_students)
    when "6"
      save_students
    when "7"
      load_students
    when "8"
      update_student
    when "9"
      exit
    else
      puts "Invalid selection"
    end
end

def update_student
  name = ask_for("name")
  selected_student = find_student(name)
  print_names(selected_student)
  confirmation = ask_for("confirmation Y/N")
  if confirmation.downcase == "y"
    selected_student.first[:cohort] = ask_for("cohort")
    selected_student.first[:hobbies] = ask_for("hobbies")
    @students.map! {|student| (student[:name] == selected_student.first[:name]) ? selected_student.first : student }
  end
end

def find_student(name)
  @students.select { |student| student[:name] == name}
end
#Method that saves students in a file called students.csv
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
#Method that loads data from a file
def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort, hobbies = line.strip.split(',')
      add_student({name: name, cohort: cohort.to_sym, hobbies: hobbies})
  end
  file.close
end
#Method that adds the hash into the global @students array
def add_student(student_hash)
  @students << student_hash
  @students.uniq! { |student| student[:name]}
end
#Method that loads the file you put as a argument
def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} students from #{filename}"
  else
    puts "Sorry #{filename} does not exist"
    exit
  end
end

#Declaration
@students = []

#Calling the Menu method
try_load_students
interactive_menu


#This code calls the methods above
#students = input_students
#print_header
#print_names(students)
#print_names_begin_a(students)
#print_length_less_12(students)
#names_by_cohort(students)
#print_footer(students)

#    binding.pry
#require 'pry'



# class Student
#   attr_accessor :name, :cohort
#   # attr_reader :attr_names
#   # attr_writer :attr_names

#   # def cohort
#   #   @cohort
#   # end

#   # def cohort=(value)
#   #   @cohort = value
#   # end

#   def initialize(name, cohort)
#     @name = name
#     @cohort = cohort
#   end
# end

# students = [
#   Student.new("marco", "june"),
#   Student.new("kori", "december"),
#   Student.new("alex", "june")
# ]

# students.sort_by(&:cohort)
# students.sort_by {|student| student.cohort }