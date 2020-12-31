# Lobsters Scraper

Visits a lobste.rs page URL, collects all the linked pages, and then scrapes the contents of the linked pages. The result is machine readable, not human readable. It was originally intended as a throwaway script to collect training data for a ML project, but now I'm using it as a scratch project for testing static type support in Ruby 3.0.0.

## Gaps

Getting types working with external libraries - in our case, Mechanize. Was able to prototype a signiture for Mechanize, but just dumping that output into scrape.rbs failed to pass type checks. Will reinvestigate Soon(TM)

## Running the scraper

```
ruby lib/scrape.rb
```

## To Profile Types using TypeProf

```
make profile_types
```

This dumps the generated types to `profile_types.output`, and then you can pick what you
want for sig/scrape.rbs. The generated code serves as a scaffold, not a final product, so
don't just dump the output in, as you'll overwrite more specific annotation added manually.

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