profile_types: 
	typeprof -Ilib lib/scrape.rb > profile_types.output

type_stats:
	steep stats --log-level=fatal

check_types:
	steep check --log-level=fatal
