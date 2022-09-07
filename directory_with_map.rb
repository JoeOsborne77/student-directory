def print_header
  puts "The students of Villains Academy".center(180)
  puts "-------------".center(180)
end

def input_students

    students = []
   
    while true do 
    puts "Please enter the names of the student"
    name = gets.tr("\n","")
    puts "What cohort are they in? Please enter the month (1 - 12)"
    cohort = cohort_method
    puts "Please enter their hobbies"
    hobbies = gets.chomp
    puts "Please enter their country of birth"
    country_of_birth = gets.chomp
    puts "Please enter their height in CM (digits only)"
    height = gets.chomp

    students << {name:name , cohort:cohort, hobbies:hobbies, country_of_birth:country_of_birth , height:height}
    
    puts "Now we have #{students.count} student. Would you like to add another student? Y / N"
    more = gets.chomp
    break if more == "N"  
    end
   students
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
    puts "Nil input, #{default_cohort} cohort will be added"
    cohort = default_cohort
  else
    puts "Input not recognised, #{default_cohort} cohort was added"
    cohort = default_cohort

  end
  end

=begin
iterate over it and only print the students from that cohort.
=end

def print(students)
  puts "What cohort would you like to see?"
  display_cohort = gets.chomp.to_sym
  #display all students whose :cohort matches display_cohort

  students.map do |student| if student[:cohort] == display_cohort then students.each_with_index do |student, index| 
     puts "#{index +1}. #{student[:name]}. #{student[:cohort]} cohort. 
      Enjoys #{student[:hobbies]}. Was born in #{student[:country_of_birth]}, 
     is #{student[:height]}cm's tall".center(180)
    end  
  end
end
end

def print_footer(names)
  if names.count > 1
  puts "Overall, we have #{names.count} great students".center(180)
  else
  puts "Overall, we have #{names.count} great student."
end
end

students = input_students
print_header
print(students)
print_footer(students)