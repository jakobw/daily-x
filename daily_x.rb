require_relative 'imgur'

class DailyX
  def initialize(sub, imgur_key)
    @sub = sub
    @imgur = Imgur.new imgur_key
  end

  def download
    dir = File.dirname(__FILE__) + "/#{@sub}"
    Dir.mkdir dir unless File.exists?(dir)

    return if downloaded_today?(dir)
    `wget -P #{dir} #{@imgur.subreddit_top_day(@sub)['data'].first['link']}`
  end

  def downloaded_today?(dir)
    latest_create = Dir.entries(dir)
                     .drop(2)
                     .map { |f| File.new(dir + "/#{f}").ctime }
                     .max

    !latest_create.nil? && Time.now - latest_create < 3600 * 24
  end
end
