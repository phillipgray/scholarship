# these are the 1000 most common words in English transformed into Boston English (Thanks, Wikipedia!) plus additions from Universal Hub.
$single_word_dictionary = {
	wicked: "really",
	cahds: "cards",
	:didja => "did you", 
	yoah: "your/you're", 
	yeah: "year/yeah",
	staht: "start",
	hahd: "hard",
	:cah => "car",  
	:paht => "part", 
	:haht => "heart", 
	:pahty => "party", 
	:fah => "far",
	:cleah => "clear", 
	:deah => "dear",
	:sweethaht => "sweetheart",
	:sweah => "swear", 
	:dollah => "dollar", 
	:apahtment => "apartment",
	:weyah => "wear",
	:neah => "near",
	:dahk => "dark",
	:bah => "bar",
	:apaht => "apart",
	:shuah => "sure",
	:houah => "hour",
	:figgahed => "figured", 
	:figgah => "figure",
	:picha => "picture",
	:futcha => "future",
	:heah => "here", 
	:theah => "there",
	:moah => "more",
	:wheah => "where",
	:befoah => "before",
	:cayah => "care",
	:cayahful => "careful",
	:anymoah => "anymore",	
	:fiah => "fire",
	# :scayed => "scared",
	:anywheah => "anywhere",
	:somewheah => "somewhere",
	:tieyid => "tired",
	:entieya => "entire",
	:nevah => "never",
	:ovah => "over",
	:bettah => "better",
	:evah => "ever",
	:othah => "other",
	:aftah => "after",
	:togethah => "together",
	:mah => "mom",
	:mothah => "mother",
	:undah => "under",
	:fathah => "father",
	:anothah => "another",
	:mattah => "matter",
	:whatevah => "whatever", 
	:remembah => "remember",
	:laytah => "later",
	:brothah => "brother",
	:sistah => "sister",
	:daughtah => "daughter",
	:dinnah => "dinner",
	:ansah => "answer",
	:wondahful => "wonderful",
	:numbah => "number",
	:watah => "water",
	:ordah => "order",
	:powah => "power",
	:wondah => "wonder",
	:rathah	=> "rather",
	:murdah => "murder",
	:longah => "longer",
	:paypah => "paper",
	:offah => "offer",
	:neithah => "neither",
	:lawyah => "lawyer",
	:covah => "cover",
	:fahget => "forget",
	:fahgot => "forgot",
	:fahgive => "forgive",
	:doah => "door",
	:doctah => "doctor",
	:victah => "victor",
	:floah => "floor",
	:frappe => "milkshake",
	:grindah => "sub",
	:uey => "u-turn",
	:jimmies => "chocolate sprinkles",
	:somahville => "somerville",
	:medfid => "medford",
	:milkshake => "flavored milk",
	:beah => "beer",
	:packie => "liquor store",
	:chahm => "charm",
	:rotary => "traffic circle",
	:bubblah => "water fountain",
	:southie => "south Boston",
	:eastie => "east Boston",
	:tonic => "soda",
	:ahnt => "aunt",
	ah: "are/our",
	:foah => "four/for",

}

# declare important variables here

# helper methods begin here
def make_list(text)
	raw_text_array = text.split(" ")
	return raw_text_array
end

def capitals?(word)
	# tests word to see if there's a capital letter
	# returns boolean

	if /[A-Z]/.match(word)
		return true
	else
		return false
	end
end

def find_store_capitals(text_array)
	# this method takes a text array as an argument and 
	# 	returns an array containing the indexes of all
	# 	all the capitalized words in the text array

	index_capital_words = []
	i = 0
	text_array.each {|word|
		if capitals?(word) == true
			index_capital_words.push(i)
		end
		i += 1
	}
	return index_capital_words
end

def term_punct?(word)
	# method takes a word and returns
	#	true if terminal punctuation (, . ? !) is present

	if /[\,\.\?!]/.match(word)
		return true
	else
		return false
	end
end

def find_store_punctuation(text_array)
	# method takes text array as argument and
	#	returns hash with key value pairs as follows
	#	"<punct>" => (index_1, index_2)

	hash_term_punct = {}
	comma_index = []
	period_index = []
	qm_index = []
	em_index = []

	text_array.each {|word|
		case word
			when /\,/
				comma_index.push(text_array.index(word))
				word.chomp!(",")
			when /\./
				period_index.push(text_array.index(word))
				word.chomp!(".")
			when /\?/
				qm_index.push(text_array.index(word))
				word.chomp!("?")
			when /!/
				em_index.push(text_array.index(word))
				word.chomp!("!")
			else
			end
	}
	
	hash_term_punct[","] = comma_index unless comma_index.empty?
	hash_term_punct["."] = period_index unless period_index.empty?
	hash_term_punct["?"] = qm_index unless qm_index.empty?
	hash_term_punct["!"] = em_index unless em_index.empty?

	no_punct_array = text_array

	return [hash_term_punct, no_punct_array]
end

def word_search_replace(stripped_text_array, dictionary)
	# method takes scrubbed text array and dictionary as hash
	#	and replaces English words
	#	with Boston words, returning changed text array

	stripped_text_array.each {|word|
		dictionary.each {|k, v|
			word.gsub!(k.to_s, v)

		}

	}


	# dictionary.each {|k, v|
	# 	stripped_text_array.each{|word|
	# 		word.gsub!(k.to_s, v)
	# 	}
	# }

	changed_text_array = stripped_text_array
	return changed_text_array
end

def restore_capitals(trans_text_array, index_array)
	# this method takes in a translated array of strings and
	#	a list of array indices to previously capitalized words
	#	and returns the array of strings with capitalization

	index_array.each {|i|
		trans_text_array[i].capitalize!
	}
	cap_text_array = trans_text_array
	return cap_text_array
end

def restore_punct(cap_text_array, punct_hash)
	# method takes text array of capitalized words and hash containing
	#	punctuation and indices and returns a text array with terminal
	#	punctuation restored

	punct_hash.each {|mark, indices|
		indices.each {|loc|
			cap_text_array[loc].concat(mark)
		}
	}

	return cap_text_array
end

def back_to_string(final_text_array)
	final_text = final_text_array.join(" ")
	return final_text
end

# main translator function with menu and flow control here

def boston_translator()

	script_exit = false

	system "clear"

	puts "Welcome to Boston. We can be a little hahd to undahstand, \nso I figgahed I'd help you out."

	while script_exit == false
		puts "-------------------------------------------"
		puts "Whaddaya wanna do?"
		puts "'Lookup' a word or 'translate' somethin?\n'Help' if you're not sure what I can do.\nOr if you wanna leave, 'gtfo.'"
		choice = gets.chomp.downcase

		case choice

		when "gtfo"
			puts "See ya!"
			script_exit = true

			next

		when "translate"
			puts "-------------------------------------------"
			puts "Alright, what didja say?"
			original_text = gets.chomp
			
			puts "Gimme a sec..." + "\n"

			original_text_array = make_list(original_text)
			# puts original_text_array

			capitals_array = find_store_capitals(original_text_array)
			# puts capitals_array

			down_text_array = original_text_array.each {|word| word.downcase!}
			# puts down_text_array

			punct_hash, bare_text = find_store_punctuation(down_text_array)[0], find_store_punctuation(down_text_array)[1]
			# puts punct_hash
			# puts bare_text

			trans_text = word_search_replace(bare_text, $single_word_dictionary)

			final_text = restore_punct(restore_capitals(trans_text, capitals_array), punct_hash)

			puts "You said: " + back_to_string(final_text) + "\n"

			next

		when "lookup"
			puts "-------------------------------------------"
			puts "Whaddaya wanna lookup?"

			boston_word = gets.chomp.downcase
			
			puts "Gimme a sec..." + "\n"
			boston_word_singleton = boston_word.split
			
			final_word = word_search_replace(boston_word_singleton, $single_word_dictionary)

			if back_to_string(final_word) == boston_word
				puts "I've nevah heard the word #{boston_word} befoah. Heh. Must not exist."
			else
				puts "That means: " + back_to_string(final_word)
			end

			
			next

		when "help"
			puts "\n"
			puts "So I'm a pretty smaht translatah. I know most of the most common English words\nas a Bostonian would say them. \nBasic spelling rules: ar, re, er, => ah.\nI also know some of the words from Universal hub,\nlike grindah, jimmies, and wicked.\nSo test me out, and see what I know."
			puts "\n"

		else
			puts "Don't be fresh. That's not an option. Try again" + "\n"

			next

		end


		
	end
	
end

# unused code for the future

# syllable_dictionary = {
# 	ar: "ah",
# 	re: "ah",
# 	er: "ah",
# 	eh: "aw",
# }
# complex_dictionary = {
# 	:"water fountain" => "we're"
# }

# old notes
# ideas for scholarship submission

=begin
Include a menu for choosing options.
	* have an explicit/clean version exit commmand: gtfo vs i'm outta heah
	1) sentence translation based on hash
	2) pronunciation lookup
		a) against hash table
		b) attempt to translate by slicing string and looking for easily translatable chunks. e.g. er => ah, our/ore => oah

*use a hash with punctuation and numbers to store and recall punctuation during translation
*find a way to preserve capitalization => maybe using an array of string indexes?
=end