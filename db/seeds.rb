# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'yaml'

def destroy_all
	User.destroy_all
	Tweet.destroy_all
	TweetTag.destroy_all
	Tag.destroy_all
	p 'everything is gone'
end


def nokopiri(character)
	character = character.split(' ')
	img = Nokogiri::HTML(open("https://www.google.com/search?tbm=isch&q=#{character[0]}+#{character[1]}")).css('img').attr('src').value
	character = character.join
	File.open("app/assets/images/autopics/#{character}.png",'wb'){ |f| f.write(open(img).read) }
end

destroy_all

character_array = []

until character_array.count == 20
	character = Faker::TwinPeaks.character
	character_array.include?(character) ? '' : character_array.push(character)
end

character_array.each do |character|

	pic = nokopiri(character)
	character = character.delete(' ')
	User.create!(name: character, username: character, bio: Faker::TwinPeaks.quote, location: Faker::TwinPeaks.location, 
		email: "#{character}@tp.com", password: "111111", autopic: "autopics/#{character}.png", bot: :true)

end

User.create!(name: 'Thomas DeFelice', username: 'ThomasArch', bio: "It's me!", location: 'Asheville', email: "thomasarch@gmail.com", password: '111111', autopic: "autopics/default.png")


  


