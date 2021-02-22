# frozen_string_literal: true

require 'faraday'

class Scraper
  def initialize(url:)
    page = fetch_body_page(url: url)
    @parsed_page = Nokogiri::HTML(page)
  end

  def get_headings!(member_id:)
    @parsed_page.css('h1', 'h2', 'h3').each do |heading|
      Heading.create(member_id: member_id, text: heading.text)
    end
  end

  private

  def fetch_body_page(url:)
    response = Faraday.get(url) do |req|
      req.headers['Content-Type'] = 'application/html'
    end
    response.body
  end
end
