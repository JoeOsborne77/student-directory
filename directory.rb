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
  puts "The Students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  cohort_groups = []
  print_header
  @students.map do |each_student| unless cohort_groups.include?(each_student[:cohort]) 
  cohort_groups << each_student[:cohort]
  cohort_groups.each do |cohort| 
    puts cohort.to_s.upcase.center(100)
      @students.each_with_index do |student, index| if student[:cohort] == cohort && student[:name] != ""
        puts "#{index+1}. #{student[:name]}. Enjoys #{student[:hobbies]}. Was born in #{student[:country_of_birth]} and is #{student[:height]} cm's tall.".center(100)
      end
    end
  end
  end
  end
end

def print_footer(students)
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(100)
    else
    puts "Overall, we have #{@students.count} great student.".center(100)
  end
end


  # 2. read the input and save it into a variable
  # 3. do what the user has asked
  # 4. repeat from step 1

  def interactive_menu
    students = []
    loop do
      # 1. print the menu and ask the user what to do
      puts "1. Input the students"
      puts "2. Show the students"
      puts "9. Exit" # 9 because we'll be adding more items
      # 2. read the input and save it into a variable
      selection = gets.chomp
      # 3. do what the user has asked
      case selection
      when "1"
        students = input_students
      when "2"
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
      end
    end
  end

  interactive_menu