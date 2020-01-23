require_relative '../config/environment'
require 'tty-prompt'
prompt = TTY::Prompt.new

def ttyprompt(text,arr)
    prompt = TTY::Prompt.new
    prompt.select(text,arr)
end

def run
    prompt = TTY::Prompt.new

    name = prompt.ask("Hello! Please enter your name")
    def new_buyer(name)
        Buyer.create(name: name)
    end

    new_user = new_buyer(name)
    
    while true do 
        input = ttyprompt("Hello #{name}! What would you like to do today?", ["Check listings?", "Check favorites?", "Exit"])
        case input 
            when "Check listings?"
                all_listings = Listing.all.map { |listing| "#{listing.id} | #{listing.description} | #{listing.price}"}
                listing = ttyprompt("Here are the listings!", all_listings) 
                prompt.yes?("Would you like to save this listing as your favorite?")
                new_user.listings << Listing.find(listing.split("|")[0])
            when "Check favorites?"
                if new_user.listings == []
                    prompt.say("Sorry, you have no listings!")
                else
                    user_listings = new_user.favorites.map { |favorite| "#{favorite.listing.id} | #{favorite.listing.description} | #{favorite.listing.price} | #{favorite.comment}"}
                    buyer_input = ttyprompt( "What would you like to do? ", user_listings)
                    delete_listing = ttyprompt("Would you like to delete this listing?", ["Yes", "No"])
                    if delete_listing == "Yes"
                        Favorite.find_by(buyer_id: new_user.id, listing_id: buyer_input.split("|")[0] ).delete
                        new_user = Buyer.find(new_user.id)
                        puts "Your favorites have been updated!"
                    elsif delete_listing == "No"
                        comment_listing = ttyprompt("Would you like to add a comment to your listing?", ["Yes", "No"])
                        if comment_listing == "Yes"
                            selected_listing = Favorite.find_by(buyer_id: new_user.id, listing_id: buyer_input.split("|")[0] )
                            user_input = gets.strip
                            selected_listing.comment = user_input
                            selected_listing.save
                            # selected_listing.update(buyer_id: new_user.id, listing_id: buyer_input.split("|")[0], comment: user_input)
                            new_user = Buyer.find(new_user.id)

                            #binding.pry
                        elsif comment_listing == "No"
                            buyer_input
                        end
                    else
                        "Exit"
                    end
                end
            when "Exit"
                puts "Goodbye!"
            break
        end
    end
end



run














