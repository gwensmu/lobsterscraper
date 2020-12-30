require 'mechanize'

# Visits a lobste.rs URL, collects all the linked pages, and then
# scrapes the contents of the linked pages
# result is machine readable, not human readable,
# intended for use as training data
class LobstersScraper
  def initialize(aggregator_url: 'http://lobste.rs', file: '../results/data.txt')
    @agent = Mechanize.new
    @current_page = @agent.get(aggregator_url)
    @links = []
    @destination_file = file
  end

  def get_linked_resources(pages: 100)
    pages.times do
      @links.concat(get_links(@current_page))
      go_to_next_page(@current_page)
    end
  end

  def extract_linked_content
    @links.each do |uri|
      begin
        content = get_page_content(uri)
        write_extracted_content(content, file: @destination_file)
      rescue StandardError => e
        puts "error scraping #{uri}: #{e.message}"
      end
    end
  end

  private

  def get_links(page)
    page.links.map do |link|
      link.uri.to_s if is_scrapable?(link)
    end
  end

  def go_to_next_page(page)
    if (link = page.links.select { |l| l.text.include?('>>') }.first)
      sleep 1 # be polite
      @current_page = link.click
    else
      puts 'Could not find ">>" link, probably on the last page'
    end
  end

  def get_page_content(uri)
    puts uri
    page = @agent.get(uri)
    text = page.search('p').map { |p| p.children.first.text }.join(' ')
    text.chomp
  end

  def write_extracted_content(content, file:)
    f = File.open(file, 'a')
    f.puts content
    f.close
  end

  def is_scrapable?(link)
    is_denoted_url = link.dom_class == 'u-url'
    is_hypertext = link.uri.to_s.include?('http')
    is_pdf = link.split('.')[-1] == 'pdf'
    is_denoted_url && is_hypertext && !is_pdf
  end
end

scraper = LobstersScraper.new
scraper.get_linked_resources
scraper.extract_linked_content
