@students = [] # an empty array accesible to all methods

@width = 90

require 'csv'

def input_students
  
  while true do
    
    puts "Please enter the name of the student and their cohort"
    puts "To finish, just hit return twice"
  
    name = STDIN.gets.chomp
    break if name.empty?
    name = make_capitals(name)
    
    puts "Enter cohort"
    cohort = STDIN.gets.chomp
  
    cohort.empty? ? cohort = "November" : cohort
    
    cohort = check_typo(cohort)
    
    students_array(name, cohort)
    puts "now we have #{@students.count} students"
    
  end
end
  
def check_typo(cohort)
  check_typo = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
  while !check_typo.include?(cohort.downcase.capitalize) do
    puts "Enter cohort"
    cohort = STDIN.gets.chomp
  end 
  cohort
end

def make_capitals(name)
  name.split(" ").map { |x| x.downcase.capitalize }.join(" ")
end

def students_array(name, cohort)
  @students << {name: name, cohort: cohort.downcase.capitalize.to_sym}
end

def print_header
  puts "The students of Villains Academy".center(@width)
  puts "---------------".center(@width)
end

def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(@width)
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(@width)
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# def save_students
#   # open the file for writing
#   file = File.open("students.csv", "w")
#   # iterate over the array of students
#   @students.each do |student|
#     student_data = [student[:name], student[:cohort]]
#     csv_line = student_data.join(",")
#     file.puts csv_line
#   end
#   file.close
# end

def save_students(filename = "students.csv")
  
  puts "You are about to save to #{filename}"
  puts "Hit enter to continue or 'N' + enter to save to another new file"
  input = gets.chomp
  filename = save_or_load_new if input == "N"

  CSV.open(filename, "w") do |file|
 
    @students.each do |student|
      file << [student[:name], student[:cohort]]
      # student_data = [student[:name], student[:cohort]]
      # csv_line = student_data.join(",")
      # file.puts csv_line
      # puts "#{student[:name]} has been saved to the file"
    end
  
  end
  puts "Save to #{filename} complete"
end

def load_students(filename = "students.csv")
  
  puts "You are about to open our default file: #{filename}"
  puts "Hit enter to continue or type 'N' + enter to open a different file"
  input = gets.chomp.downcase
  filename = save_or_load_new if input == "N"
  
  # File.open(filename, "r") do |file|
  #   file.readlines.each do |line|
  CSV.foreach(filename) do |line|
    name, cohort = line[0..1]
    students_array(name, cohort)
  end
# end
end

def save_or_load_new
  puts "Enter file name"
  filename = STDIN.gets.chomp
  filename = "#{filename}.csv" if !filename.include?(".csv")
  filename
end

def try_load_students(filename = "students.csv")
  
  filename = ARGV.first unless ARGV.first.nil?

  if File.exist?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit 
  end
end

try_load_students
interactive_menu
