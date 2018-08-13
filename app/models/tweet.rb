class Tweet < ApplicationRecord
	belongs_to :user

	has_many :tweet_tags
	has_many :tags, through: :tweet_tags

	before_validation :link_check, on: :create
	validates :message, presence: true
	validates :message, length: {maximum: 250, too_long: "keep it down"}, on: :create
	after_validation :apply_link, on: :create


private

	def link_check
		if self.message.include? "https://"
			arr = self.message.split

			i = arr.map {|x| x.include? "https://"}.index(true)

			self.link = arr[i]

			if arr[i].length > 23
				arr[i] = "#{arr[i][0..20]}..."
			end

			self.message = arr.join(" ")
		end
	#link_check
	end


	def apply_link

		arr = self.message.split
		i = arr.map {|x| x.include? "https://"}.index(true)
		if i
			url = arr[i]

			arr[i] = "<a href='#{self.link}' target='_blank'>#{url}</a>"
		end
		self.message = arr.join(" ")
		


	end

# end of module	
end
