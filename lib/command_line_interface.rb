def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Character Search!"
end

def get_character_from_user
  puts "Please enter a character: "
  gets.chomp.downcase
end
