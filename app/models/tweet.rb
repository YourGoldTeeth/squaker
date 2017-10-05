class Tweet < ApplicationRecord
	belongs_to :user

	has_many :tweet_tags
	has_many :tweets, through: :tweet_tags

	validates :message, presence: true, length: { maximum: 140, too_long: "A tweet can only be 140 characters long."}
end
