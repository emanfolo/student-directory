#Create a method to input students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do 
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end 

#print them
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

def print(students)
  students.each do |student|
    if student[:name][0] == "e"
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end 

#Number of students

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header()
print(students)
print_footer(students)
