module TweetsHelper

	def get_tagged(tweet)
		message_arr = tweet.message.split

	    message_arr.each_with_index do |word, index|
	      if word[0] == '#'
	        #create new instance of a tag
	        if Tag.pluck(:phrase).include?(word.downcase)
	          #save that tag as a variable
	          tag = Tag.find_by(phrase: word.downcase)
	        else
	          tag = Tag.create(phrase: word.downcase)
	        end
	        tweet_tag = TweetTag.create(tweet_id: @tweet.id, tag_id: tag.id)

	        message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
	      end
	    end

	    tweet.update(message: message_arr.join(" "))
	    return tweet
	end

end
