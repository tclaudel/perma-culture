# frozen_string_literal: true

class BotTwitter
	attr_accessor :object, :user

	def initialize(object, user)
		@object = object
		@user = user
	end

	def tweet
		client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
			config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
		end

		client.update("#{@user} a posté un nouvel article sur perma-culture.herokuapp.com : #{@object}")
	end

	def perform
		tweet
	end
end