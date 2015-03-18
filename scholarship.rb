#ideas for scholarship submission

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

complex_dictionary = {
	"we're" => "we're"
}

# these are the 1000 most common words in English transformed into Boston English(Thanks, Wikipedia!) plus additions from Universal Hub.
single_word_dictionary = {
	wicked: "really",
	cahds: "cards",
	:didja => "did you", 
	yoah: "your/you're", 
	ah: "are/our",
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
	:foah => "four/for",
	:houah => "hour",
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
	# :scayd => "scared",
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
}

syllable_dictionary = {
	ar: "ah",
	re: "ah",
	er: "ah",
	eh: "aw",

}

#declare important variables here

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

	text_array.each {|word|
		if capitals?(word) == true
			index_capital_words.push(text_array.index(word))
		end
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
			when /\./
				period_index.push(text_array.index(word))
			when /\?/
				qm_index.push(text_array.index(word))
			when /!/
				em_index.push(text_array.index(word))
			else
			end
	}
	
	hash_term_punct[","] = comma_index unless comma_index.empty?
	hash_term_punct["."] = period_index unless period_index.empty?
	hash_term_punct["?"] = qm_index unless qm_index.empty?
	hash_term_punct["!"] = em_index unless em_index.empty?

	return hash_term_punct
end

def word_search_replace(stripped_text_array, dictionary)
	# method takes scrubbed text array and dictionary as hash
	#	and replaces English words
	#	with Boston words, returning changed text array

	dictionary.each {|k, v|
		stripped_text_array.each{|word|
			word.gsub!(k.to_s, v)
		}
	}

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