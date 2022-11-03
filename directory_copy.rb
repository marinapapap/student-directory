def input_students
  puts "Please enter the names of the students, their country of birth, age and favourite hobby".center(70)
  puts "To finish, just hit return twice".center(70)
  puts "First enter their name".center(70)
  
  students = []
  
  name = gets.chomp
  
  while !name.empty? do
    
    puts "Enter their country of birth".center(70)
    cob = gets.chomp
    
    puts "Enter their age".center(70)
    age = gets.chomp
    
    puts "Enter their favourite hobby".center(70)
    hobby = gets.chomp
    
    students << {name: name.capitalize, cob: cob, age: age, hobby: hobby, cohort: :november}
    puts "Now we have #{students.count} students".center(70)
    
    puts "Enter next name".center(70)
    name = gets.chomp

  end
  
  students
  
end

def print_header
  puts "The students of Villains Academy".center(70)
  puts "---------------".center(70)
end

def prints(students)
  index = 0
  while index < students.count do
    if students[index][:name][0] == "M" && students[index][:name].length < 12
      puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort.)".center(70)
    end
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(70)
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
    