require 'json'

require './model/user'
require './model/expanse'

INCOME         = "1"
EXPANSE        = "2"
SEARCH_RECORD  = "3"
RECORDS_LIST   = "4"
QUIT           = "q"

def print_menu(print_user)
  print_user.to_string
  puts "*** Current balance: #{print_user.budget} $ ***"
  puts "Please choose from a list of options:"
  puts "  1) New income"
  puts "  2) New expanse"
  puts "  3) Search a record"
  puts "  4) List all records"
  puts "  q - for exit"
end

def input_description(exp , key)
  begin
    puts (key == INCOME )? "Please enter income description :" :  "Please enter expanse description :"
    exp.description = gets.chomp
  end while exp.description.length<1
end

def input_expanse(exp , key)
  begin
    puts (key == INCOME )? "Please enter income amount :" :  "Please enter expanse amount :"
    exp.amount = gets.chomp.to_f
  end while  exp.amount == 0
end

def calculate_balance(expanse_for_calculate, user_for_update, what_to_do)
  input_description(expanse_for_calculate, what_to_do)
  input_expanse(expanse_for_calculate, what_to_do)
  expanse_for_calculate.type = (what_to_do == INCOME) ? "income" : "expanse"

  user_for_update.budget = (what_to_do == INCOME) ?
                               user_for_update.budget.to_f +  expanse_for_calculate.amount.to_f :
                               user_for_update.budget.to_f -  expanse_for_calculate.amount.to_f

  user_for_update.exp.push(expanse_for_calculate.to_hash)
end

current_user = User.new()
current_expanse = Expanse.new()
user_list = []

user_jason_data  = File.exist?('./db/user-data.json') ? JSON.parse(File.read('./db/user-data.json'), symbolize_names: true) : {}

is_input_ok = false
while  !is_input_ok
  puts "Please enter your name :"
  user_name = gets.chomp()
  is_input_ok =  !!(user_name.length>0) rescue false
end

user_index = -1
is_new_user = true
user_jason_data.each_with_index { | user, val |
     if  user[:name] == user_name
         current_user.to_user(user)
         is_new_user = false
         user_index = val
     end
     user_list.push(user)
}

if is_new_user
  user_index = user_list.length
  is_input_ok = false
  while  !is_input_ok
    puts "Please enter your budget (00.00) :"
    user_budget = gets.chomp()
    is_input_ok =  !!Float(user_budget) rescue false
  end
  current_user.name = user_name
  current_user.budget = user_budget
  user_list.push(current_user.to_hash)
end

is_quit = false
while !is_quit
  print_menu(current_user)
  option = gets.chomp
   case option
   when INCOME
     calculate_balance(current_expanse, current_user, INCOME)
   when EXPANSE
     calculate_balance(current_expanse, current_user, EXPANSE)
   when SEARCH_RECORD
     puts "Please enter a search term of description"
     search_value =  gets.chomp
     user_with_selected_expanse = User.new(current_user.name,
                                           current_user.budget,
                                           current_user.exp.select { |k,v| k[:description].match(/#{search_value}/) })
     user_with_selected_expanse.print_budget("for #{search_value}")
   when RECORDS_LIST
     current_user.print_budget
   when QUIT
     is_quit = true
     user_list[user_index] = current_user.to_hash
     File.write('./db/user-data.json', JSON.dump(user_list))
   else
     print_menu(current_user)
   end
end