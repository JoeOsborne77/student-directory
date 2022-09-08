@students = []
require 'csv'


def input_students
  while true do 
    puts "Please enter the names of the students"
    name = gets.tr("\n","")
    puts "What cohort are they in? Please enter by digit 1-12"
    cohort = cohort_method
    puts "What are their hobbies?"
    hobbies = gets.chomp
    puts "What country were they born in?"
    country_of_birth = gets.chomp
    puts "How tall are they? Please enter by CM digits"
    height = gets.chomp

    add_students(name, cohort, hobbies, country_of_birth, height)

    puts "Now we have #{@students.count} students. Would you like to add another student? Y / N"
    more = gets.chomp
      break if more == "N"
      end
  @students
end

def cohort_method
  default_cohort = :November
  cohort = gets.chomp
  case cohort
  when "1"
    cohort = :January
  when "2"
    cohort = :February
  when "3"
    cohort = :March
  when "4"
    cohort = :April
  when "5"
    cohort = :May
  when "6"
    cohort = :June
  when "7"
    cohort = :July
  when "8"
    cohort = :August
  when "9"
    cohort = :September
  when "10"
    cohort = :October
  when "11"
    cohort = :November
  when "12"
    cohort = :December
  when ""
    puts "No input - #{default_cohort} will be added."
    cohort = default_cohort
  else   
    puts "Unrecognised input - #{default_cohort} will be added."
    cohort = default_cohort
  end
end 

def print_header
  puts "The Students of Villains Academy".center(150)
  puts "-------------".center(150)
end

def print_student_list
  cohort_groups = []
  print_header
  @students.map do |each_student| unless cohort_groups.include?(each_student[:cohort]) 
  cohort_groups << each_student[:cohort]
  cohort_groups.each do |cohort| 
    puts cohort.to_s.upcase.center(150)
      @students.each_with_index do |student, index| if student[:cohort] == cohort && student[:name] != ""
        puts "#{index+1}. #{student[:name]}. Enjoys #{student[:hobbies]}. Was born in #{student[:country_of_birth]} and is #{student[:height]} cm's tall.".center(150)
      end
    end
  end
  end
  end
end

def print_footer
  if @students.count > 1 
    puts "Overall, we have #{@students.count} great students".center(150)
  else 
    puts "Overall, we have #{@students.count} great student.".center(150)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students 
  print_student_list
  print_footer
end

def interactive_menu
  loop do 
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      puts "Action Succesful"
      input_students
    when "2"
      puts "Action Succesful"
      show_students
    when "3"
      puts
      save_students
    when "4"
      puts 
      load_students
    when "9"
      exit
    else
      puts "Input unrecognised, please try again"
  end
end

def save_students
  puts "Please enter the filename of the file you would like to save to"
  filename = gets.chomp
  CSV.open(filename, "w") do |csv| 
  @students.each do |student|
    csv << [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth], student[:height]]
  end
  puts "#{filename} saved successfully."
end
end

def load_students
  puts "Please enter the filename of the file you would like to open"
  filename = gets.chomp
  CSV.foreach(filename, "r") do |line|
   name, cohort, hobbies, country_of_birth, height = line
  add_students(name, cohort, hobbies, country_of_birth, height)
  end
end

def add_students(name, cohort, hobbies, country_of_birth, height)
  @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
end


interactive_menu