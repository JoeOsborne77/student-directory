@students = []

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

  @students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}

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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
      puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


interactive_menu