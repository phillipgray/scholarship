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
	"we're" 
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
	:cayahful => "careful"
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
	:offah => "offer".
	:neithah => "neither",
	:lawyah => "lawyer",
	:covah => "cover",
	:befoah => "before",
	:fahget => "forget",
	:fahgot => "forgot",
	:fahgive => "forgive",
	:doah => "door",
	:doctah => "doctor",
	:victah => "victor",
	:floah => "floor",
}

syllable_dictionary = {
	ar: "ah"
	re: "ah"
	er: "ah"
	eh: "aw"

}



