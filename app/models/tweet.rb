class Tweet < ApplicationRecord
	belongs_to :user

	has_many :tweet_tags
	has_many :tweets, through: :tweet_tags

	before_validation :link_check

	validates :message, presence: true, length: { maximum: 140, too_long: "A tweet can only be 140 characters long."}

	private

	def link_check
		if self.message.include?("http://")
			array = self.message.split

			index = array.map { |word| word.include? "http://"}.index(true)

			self.link = array[index]

			if array[index].length > 23
				array[index] = "#{array[index][0..20]}..."
			end	

			self.message = array.join(" ")
		end	
	end

	def apply_link
		array = self.message.split

		index = array.map { |word| word.include? "http://"}.index(true)
		url = array[index] unless index.nil?


		unless index.nil?
			array[index] = "<a href='#{self.link}' target='_blank'#{url}</a>"
		end	
		
		self.message = array.join(" ")
	end	
end
