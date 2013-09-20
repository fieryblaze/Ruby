# Part1: Hello World
class HelloWorldClass
	def initialize(name)
		@name = name.capitalize
	end

	def sayHi
		puts "Hello #{@name}!"
	end
end

hello = HelloWorldClass.new("Luke Bunn")
hello.sayHi

# Part 2A Palindrome
def palindrome?(string)
	sSub = string.gsub(/[\W]/,'')
	sDown = sSub.downcase()
	sRev = sDown.reverse()
	if /#{sDown}/.match(sRev)
		return true#puts "\"#{string}\" is a Palindrome!!"
	else
		return false#puts "\"#{string}\" is NOT a palindrome. \:\("
	end	
end

print "PALINDROME:\n"
puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")

# Part 2B Word Count
def count_words(string)
	sHash = {}
	string.downcase.scan(/\b[\w]+/).each do |word|
		if sHash[word] == nil 
			sHash[word] = 1
		else
			sHash[word] += 1
		end
	end
	return sHash
end

print "\nWORD COUNT:\n"
print count_words("A man, a plan, a canal -- Panama")
print "\n"
print count_words("Doo bee doo bee doo")

# Part 3A Rock Paper Scissors
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def rps_game_winner(game)
	raise WrongNumberOfPlayersError unless game.length == 2
	p1Play = game[0][1].upcase()
	p2Play = game[1][1].upcase()
	raise NoSuchStrategyError unless p1Play.length == 1 && p2Play.length == 1
	raise NoSuchStrategyError unless /[RPS]/.match(p1Play) && /[RPS]/.match(p2Play)
	if p1Play == p2Play
		return game[0]
	end
	if p1Play == "R"
		if p2Play == "P"
			return game[1]
		end
		return game[0]
	end
	if p1Play == "P"
		if p2Play == "S"
			return game[1]
		end
		return game[0]
	end
	if p1Play == "S"
		if p2Play == "R"
			return game[1]
		end
		return game[0]
	end
end

print "\nROCK PAPER SCISSORS:\n"
print rps_game_winner([["Armando", "R"], ["Dave", "r"]])
print "\n"
print rps_game_winner([["Armando", "p"], ["Dave", "r"]])
print "\n"
print rps_game_winner([["Armando", "s"], ["Dave", "r"]])
print "\n"
print rps_game_winner([["Armando", "r"], ["Dave", "s"]])
print "\n"
print rps_game_winner([["Armando", "p"], ["Dave", "s"]])
print "\n"
print rps_game_winner([["Armando", "r"], ["Dave", "p"]])
print "\n"
print rps_game_winner([["Armando", "s"], ["Dave", "p"]])

# Part 3B Tournament

def rps_tournament_winner(tourney)
	if tourney[0].is_a? String
		return tourney;
	end
	if tourney[0][0].is_a? String
		return rps_game_winner(tourney)
	end
	return rps_tournament_winner([rps_tournament_winner(tourney[0]), rps_tournament_winner(tourney[1])])
end

print "\nTOURNAMENT:\n"
print rps_tournament_winner(["Armando", "P"])
print "\n"
print rps_tournament_winner([["Armando", "P"], ["Dave", "S"]])
print "\n"
print rps_tournament_winner([[["Armando", "P"], ["Dave", "S"]],[["Richard", "R"], ["Michael", "S"]]])
print "\n"
print rps_tournament_winner([[[["Armando", "P"], ["Dave", "S"]],[["Richard", "R"], ["Michael", "S"]]],
									[[["Allen", "S"], ["Omer", "P"]],[["David E.", "R"], ["Richard X.", "P"]]]])

# Part 4 Anagrams
def combine_anagrams(words)
	wSort = [[]] #holds final array of anagrams
	origLength = words.length - 1 #num of words
	sortLength = wSort.length - 1 #num of different anagrams
	wSort[0].push(words[0]) 
	#goes through each word, seeing if anagram exists for it already and adds it 
	#to that list, otherwise creates new anagram.
	for i in 1..origLength
		lower = words[i].downcase
		for j in 0..sortLength
			#check whether it's in the list of anagrams, and if so add it and break
			if lower.chars.sort.join == wSort[j][0].chars.sort.join
				wSort[j].push(words[i])
				break
			end
			if j == sortLength
				wSort.push([words[i]])
			end
		end
		sortLength = wSort.length - 1
	end
	return wSort
end
print "\nANAGRAMS:\n"
print combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'sCar', 'creams', 'scream'])
