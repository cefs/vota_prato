class HelloWorldController < ApplicationController

	def index
		hello
	end

	def hello
		render text: "ola mundo"
	end
end
