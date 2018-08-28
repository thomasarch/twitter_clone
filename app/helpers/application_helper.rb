module ApplicationHelper
	def hello
		"hello there"
	end

	def show_pic(user)
		user.avatar.url.nil? ? user.autopic : user.avatar
	end

	def random_tweet
		# User.all.pluck(:id).sample
		
		tweeter = User.find(User.where(bot: true).pluck(:id).sample)
		Tweet.create!(message: Faker::TwinPeaks.quote, user_id: tweeter.id)

		# Tweet.create!(message: Faker::TwinPeaks.quote)
	end


	def suggest
	    @suggestions = []

	    User.all.each do |user|
	      unless current_user.following.include?(user.id.to_s)
	        @suggestions.push(user)
	        @suggestions = @suggestions.shuffle
	      end
	    end
	end
end


