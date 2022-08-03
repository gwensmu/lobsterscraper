profile_types: 
	typeprof -Ilib lib/scrape.rb > profile_types.output

type_stats:
	bundle exec steep stats --log-level=fatal

check_types:
	bundle exec steep check --log-level=fatal
