class RpgController < ApplicationController
	@@time = Time.new
	def index
		if session[:messages] == nil
			session[:messages] = Array.new
			session[:gold] = 0
		end
		@gold = session[:gold]
		@messages = session[:messages].reverse
	end
	def farm
		@rand = rand(10..20)
		@timestamp = @@time.strftime('%Y/%m/%d %H:%M %p')
		@message = ["Earned #{@rand} gold from the farm! (" + @timestamp + ")", "green"]
		session[:gold] += @rand
		session[:messages].push(@message)
		redirect_to '/'
	end
	def cave
		@rand = rand(5..10)
		@timestamp = @@time.strftime('%Y/%m/%d %H:%M %p')
		@message = ["Earned #{@rand} gold from the cave! (" + @timestamp + ")", "green"]
		session[:gold] += @rand
		session[:messages].push(@message)
		redirect_to '/'
	end
	def house
		@rand = rand(2..5)
		@timestamp = @@time.strftime('%Y/%m/%d %H:%M %p')
		@message = ["Earned #{@rand} gold from the house! (" + @timestamp + ")", "green"]
		session[:gold] += @rand
		session[:messages].push(@message)
		redirect_to '/'
	end
	def casino
		@rand = rand(-50..50)
		@timestamp = @@time.strftime('%Y/%m/%d %H:%M %p')
		if @rand >= 0
			@message = ["Earned #{@rand} gold from the casino! (" + @timestamp + ")", "green"]
		else
			@message = ["Lost #{@rand} gold to the casino! (" + @timestamp + ")", "red"]
		end
		session[:gold] += @rand
		session[:messages].push(@message)
		redirect_to '/'
	end
	def reset
		session[:messages] = nil
		session[:gold] = nil
		redirect_to '/'
	end
end
