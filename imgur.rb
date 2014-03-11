require 'httparty'

class Imgur
  include HTTParty
  base_uri 'https://api.imgur.com/3/'

  def initialize(key)
    @key = key
  end

  def subreddit_top_day(sub)
    self.class.get(
      "/gallery/r/#{sub}/top/day",
      headers: { 'Authorization' => "CLIENT-ID #{@key}" }
    ).parsed_response
  end
end
