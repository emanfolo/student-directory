@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = gets.chomp

  while !name.empty? do 
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end 

def interative_menu
  loop do 
    print_menu()
    process(gets.chomp)
  end
end

def print_menu
  puts "1) Input the students"
  puts "2) Show the students"
  puts "3) Save the list to the students.csv"
  puts "9) Exit"
end

def show_students
  print_header()
  print_list()
  print_footer()
end

def process(selection)
  case selection
  when "1"
    input_students()
  when "2"
    show_students()
  when "3"
    save_file()
  when "9"
    exit
  else
    puts "I Don;t know what you meant, try again"
  end
end 

#print them
def print_header
    if @students.count > 0
      puts "The students of Villains Academy"
      puts "------------"
    end
end

def print_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end 

#Number of students

def print_footer
  if @students.count > 0
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_file
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interative_menu()
