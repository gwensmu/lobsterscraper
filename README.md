# Lobsters Scraper

Visits a lobste.rs page URL, collects all the linked pages, and then scrapes the contents of the linked pages. The result is machine readable, not human readable. It was originally intended as a throwaway script to collect training data for a ML project, but now I'm using it as a scratch project for testing static type support in Ruby 3.0.0.

## Next Steps

Getting types working with external libraries - Mechanize. Currently in dependency / rural wifi hell related to the Ruby 3.0.0 so will revisit Later(TM)

## Running the scraper

```
ruby lib/scrape.rb
```

## To Profile Types using TypeProf

```
make profile_types
```

## Checking types with Steep

```
make check_types
```

### Getting type coverage stats

```
make type_stats
```

## References

https://evilmartians.com/chronicles/climbing-steep-hills-or-adopting-ruby-types