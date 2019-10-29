class Logger
	def self.log(message)
		f = File.open("logs.txt", "a")
		f << message
		f.close
	end
end