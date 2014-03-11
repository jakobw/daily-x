daily-x
=======

Downloads the daily top image of a given subreddit from Imgur.

## Example
	daily_aww = DailyX.new 'aww', ENV['IMGUR_KEY']
	daily_aww.download

This creates a directory `aww` and downloads the top picture of the day from `/r/aww` into it.
