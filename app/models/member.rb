# frozen_string_literal: true

class Member < ApplicationRecord
  include ShortenerHelper

  belongs_to :user

  before_save :generate_shortened_website_url

  private

  def generate_shortened_website_url
    self.website_short_url = url_shortener(url: website_url)
  end
end
