require_relative '../config/environment'
require 'tty-prompt'

prompt = TTY::Prompt.new
name = prompt.ask("What is your name?")
prompt.say("hello! #{name}")
#Buyer.new =  

choice = prompt.select("What would you like to do today?") do |menu|
    menu.choice name: "Check all listings?"
    menu.choice name: "Check favorites?"
end




if choice == "Check all listings?"
    question1 = "Choose a listing."
    listing_choice = Listing.all.each { |listing| puts listing} 
    all_listings = prompt.select(question1, listing_choice)
    add_choice = prompt.select("Add?") do |menu|
        menu.choice name: "Add to favorites?"
        menu.choice name: "Go back"
    end
    if add_choice == "Add to favorites?"
        #Favorite.all << 
        

    elsif add_choice == "Go back"
          
        
    end
        


elsif choice == "Check favorites?"
    question2 = "See your favorites?"
    favorite_choice = Favorite.all.each { |favorite| puts favorite.buyer_id ==buyer.id}
    all_favorites = prompt.select(question2, favorite_choice)
    add_fave_choice = prompt.select()

else 
    puts "NO"
end



end








# Buyer.create(name: name)
# prompt.select("What would you like to do?", %w(All_listings My_listings))

#binding.pry



















# prompt = TTY::Prompt.new
# prompt.ask("What is your name?")
# prompt.select("What would you like to do?", %w(All_listings My_listings))

# system("clear")

# def prompt_user
#     system("clear")
#     puts "Hello! Please enter your name?"
#     name = gets 
#     puts "Welcome #{name}! What would you like to do today?"
#     puts ""
# end

# prompt_user

#     user_input = gets.chomp.to_i
#     action_router(user_input)
# end

# def action_router(input)
#     case input 
#     when 1
#         create_buyer
#     end
#     gets.chomp
#     prompt_user
# end

# def create_buyer
#     Buyer.create(:name)
# end




