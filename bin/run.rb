require_relative '../config/environment'
require 'tty-prompt'
prompt = TTY::Prompt.new

def ttyprompt(text,arr)
    prompt = TTY::Prompt.new
    prompt.select(text,arr)
end

# def new_buyer(name)
#     Buyer.new(name: name)
# end




# def print_price(listing)
#     puts listing.price
# end 


# def buyer_favorite
#     Favorite.all.select do |favorite|
#         favorite.buyer_id == buyers.id
#     end
# end
#binding.pry




def run
    prompt = TTY::Prompt.new

    name = prompt.ask("Hello! What is your name?")
    def new_buyer(name)
        Buyer.create(name: name)
    end

    new_user = new_buyer(name)
 #binding.pry
    
    while true do 
        input = ttyprompt("Hello #{name}! What would you like to do today?", ["Check listings?", "Check favorites?", "Exit"])
        case input 
            when "Check listings?"
                # displays all the listings
                # select a listing to be added as a favorite for the current buyer

                # I need to make a Favorite
                # What do i need to make a Favorite?
                    # buyer_id -> Create a new buyer when the user enters their name
                    # listing_id -> User selected input
                all_listings = Listing.all.map { |listing| "#{listing.id} | #{listing.description} | #{listing.price}"}
                listing = ttyprompt("Here are the listings!", all_listings) 
                prompt.yes?("Would you like to save this listing as your favorite?")
                # Favorite.create(buyer_id:  new_user.id, listing_id: listing.split("|")[0])
                new_user.listings << Listing.find(listing.split("|")[0])

                # Favorite.create(user_id: user.id, listing_id: listing.id)
                #binding.pry
            when "Check favorites?"
                if new_user.listings == []
                    prompt.say("Sorry, you have no listings!")
                else
                    puts user_listings=new_user.listings.map { |listing| "#{listing.id} | #{listing.description} | #{listing.price}"}
                    buyer_input = ttyprompt( "What would you like to do? ", user_listings)
                    delete_listing = ttyprompt("Would you like to delete this listing?", ["Yes", "No"])
                    if delete_listing == "Yes"
                        user_listings.destroy_all
                    elsif delete_listing == "No"
                        buyer_input
                    else

                        "Exit"
                    end
                end
                
        
                #binding.pry
                
                #new_user.listings.map { |listing| }
                # display all buyers favorites
                # delete a favorite
                # write a comment on a favorite
                # if there are no favorites display there are no favorites
                #favorites = ttyprompt("Here are your favorites!", [Favorite.all.each { |favorite| favorite.buyer_id == new_user.id}])
                #binding.pry
            when "Exit"
            break
        end
    end
end



run














