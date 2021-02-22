# frozen_string_literal: true

class Member < ApplicationRecord
  include ShortenerHelper

  belongs_to :user
  has_many   :headings

  before_save :generate_shortened_website_url
  after_save :scrap_headings!

  private

  def generate_shortened_website_url
    self.website_short_url = url_shortener(url: website_url)
  end

  def scrap_headings!
    return unless saved_change_to_attribute?(:website_url)

    # Ensures clean headings after the website_url changed
    self.headings.destroy_all

    scraper = Scraper.new(url: self.website_url)
    scraper.get_headings!(member_id: self.id)
  end
end
