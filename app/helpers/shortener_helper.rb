# frozen_string_literal: true

module ShortenerHelper
  BITLY_TOKEN = ENV.fetch('BITLY_TOKEN')

  def url_shortener(url:)
    bitlink = bitly_client.shorten(long_url: url)
    bitlink.link
  end

  def bitly_client
    @bitly_client ||= Bitly::API::Client.new(token: BITLY_TOKEN)
  end
end
