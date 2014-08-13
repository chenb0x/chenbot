#!/usr/local/rvm/rubies/ruby-2.1.2/bin/ruby
require 'twitter'
=begin
This is the Chenb0t(http://chenb0x.net) by MasterChen(infoinject[at]gmail.com).
It is designed to be an automated social media manager, starting with Twitter and moving outwards from there.
This project is open source and may be used freely as long as I get an honorable mention ;-)
=end
	mc = Twitter::REST::Client.new do |config|
	config.consumer_key        = "YOUR_CONSUMER_KEY"
	config.consumer_secret     = "YOUR_CONSUMER_SECRET"
	config.access_token        = "YOUR_ACCESS_TOKEN"
	config.access_token_secret = "YOUR_ACCESS_TOEKEN_SECRET"
	end

#One array to tweet them all!
tweet_array = []

#High random for entropy?
d = rand(1200).to_i

#Load text file based on RNG. Only one array needed here.
tweet_array = IO.readlines('/home/chen/chenbot/zensay.txt') if d % 6 == 0
tweet_array = IO.readlines('/home/chen/chenbot/kempo.txt') if d % 6 == 1
tweet_array = IO.readlines('/home/chen/chenbot/highlights.txt') if d % 6 == 2
tweet_array = IO.readlines('/home/chen/chenbot/quotes.txt') if d % 6 == 3
tweet_array = IO.readlines('/home/chen/chenbot/social.txt') if d % 6 == 4
tweet_array = IO.readlines('/home/chen/chenbot/koans.txt') if d % 6 == 5

#Make the new array as big as the loaded textfile and grab a random num  based on that length
r = rand(tweet_array.length).to_i
mc.update(tweet_array[r] + "#chenb0t")

#Autofollow users who stary following you. Optional.
follower_ids = []
mc.follower_ids("chenb0x").each do |id|
  follower_ids.push(id)
end
 
friend_ids = []
mc.friend_ids("chenb0x").each do |id|
  friend_ids.push(id)
end
 
mc.follow(follower_ids - friend_ids)

