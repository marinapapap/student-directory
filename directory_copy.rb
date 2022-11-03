def input_students
  puts "Please enter the names of the students, their cohort, their country of birth, age and favourite hobby"
  puts "To finish, just hit return twice"
  puts "First enter their name"
  students = []
  
  name = gets.chomp
  
  while !name.empty? do
      
    puts "Enter cohort"
    cohort = gets.chomp
  
    if cohort.empty?
      cohort = "November"
    end
    
    check_typo = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    while !check_typo.include?(cohort.capitalize) do
      puts "Enter cohort"
      cohort = gets.chomp
    end 
    
    # puts "Enter their country of birth"
    # cob = gets.chomp
    
    # puts "Enter their age"
    # age = gets.chomp
    
    # puts "Enter their favourite hobby"
    # hobby = gets.chomp
    
    students << {name: name.capitalize, cohort: cohort.downcase.to_sym}
    # , cob: cob, age: age, hobby: hobby
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    
    puts "Enter next name"
    name = gets.chomp

  end
  
  students
  
end

def print_header
  puts "The students of Villains Academy"
  puts "---------------"
end

def prints(students)
  
  cohorts = {}
  
  students.each do |x|
    month = x[:cohort]
    name = x[:name]
    
    if cohorts[month] == nil
      cohorts[month] = []
    end
      
    cohorts[month].push(name)
  end
  
  puts "Input category"
  cat = gets.chomp

  print "The students in the #{cat.capitalize} cohort are: #{cohorts[cat.to_sym]}\n"
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
prints(students)
print_footer(students)



# students.each_with_index do |student, index|
#     if (student[:name][0] == "M" || student[:name][0] == "m") && student[:name].length < 12
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end


    # students << {name: name.capitalize, cohort: :november}
    # puts "now we have #{students.count} students"
    
    # name = gets.chomp
    

#  index = 0
#   while index < students.count do
#     if students[index][:name][0] == "M" && students[index][:name].length < 12
#       puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort.)".center(70)
#     end
#     index += 1
#   end
