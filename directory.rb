def input_students
    puts "Please enter the name of the students"
    name = gets.chomp
    puts "Please enter their hobbies"
    hobbies = gets.chomp
    puts "Please enter their country of birth"
    country_of_birth = gets.chomp
    puts "Please enter their height in CM (digits only)"
    height = gets.chomp
    puts "Please enter their age"
    age = gets.chomp
    puts "To finish, just hit return twice"
 
    students = []
  
    while !name.empty? do 
    students << {name:name , cohort: :November , hobbies:hobbies, country_of_birth:country_of_birth , height:height, age:age}
    puts "Now we have #{students.count} students"
    puts "Please enter the names of the student"
    name = gets.chomp
    puts "Please enter their hobbies"
    hobbies = gets.chomp
    puts "Please enter their country of birth"
    country_of_birth = gets.chomp
    puts "Please enter their height in CM (digits only)"
    height = gets.chomp
    puts "Please enter their age"
    age = gets.chomp
    puts "To finish, just hit return twice"

    end
    students
  end
 

def print_header
  puts "The students of Villains Academy".center(180)
  puts "-------------".center(180)
end

def print(students)
  students.each.with_index(1) do |student, index|
    while student[:name].start_with?("a") && student[:name].length < 12
    puts "#{index} #{student[:name]} #{student[:cohort]} cohort. Enjoys #{student[:hobbies]}. Was born in #{student[:country_of_birth]}, is #{student[:height]}cm's tall and #{student[:age]} years old.".center(180)
    break     
end
end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(180)
end

students = input_students
print_header
print(students)
print_footer(students)