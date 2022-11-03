def input_students
  puts "Please enter the names of the students, their country of birth, age and favourite hobby"
  puts "To finish, just hit return twice"
  puts "First enter their name"
  
  students = []
  
  name = gets.chomp
  
  while !name.empty? do
    
    puts "Enter their country of birth"
    cob = gets.chomp
    
    puts "Enter their age"
    age = gets.chomp
    
    puts "Enter their favourite hobby"
    hobby = gets.chomp
    
    students << {name: name.capitalize, cob: cob, age: age, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students"
    
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
  index = 0
  while index < students.count do
    if students[index][:name][0] == "M" && students[index][:name].length < 12
      puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort.)"
    end
    index += 1
  end
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
    