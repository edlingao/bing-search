require 'rest-client'
require 'launchy'
require 'colorize'

class Bing
    attr_accessor :doc,:html
    def initialize
        
    end
    def search (search)
        @doc = RestClient.get 'http://bing.com/search', params: {q: search}
        @html = File.open('index.html', 'w')
        @html.puts(@doc.body)
        @html.close
        "Search of #{search.colorize(:light_yellow)} is complete and located on index.html\nTo preview it please run Bing.html"
    end
    def html
        Launchy::Browser.run('./index.html');
    end
end

b = "BING".colorize(:light_yellow);
condition = false
loop do
    system("clear")
    puts "Welcome to #{b} terminal search\nPlease Select an option: \n1.-Search\n2.-Look search on an html page\n3.-Exit"
    opt = gets.chomp
    b_search = Bing.new()
    case opt
    when "1" then 
        system("clear")
        print "Please search something\n::>_ " 
        search = gets.chomp
        print b_search.search(search)
        puts "\nPress enter to continue..."
        gets.chomp
    when "2" then 
        system("clear")
        if b_search.doc != nil
            puts "Please first search something"
            gets.chomp
        else
            b_search.html
        end
    when "3" then
        system("clear")
        puts "See ya later!..."
        condition = true
    end


    break if condition

end









