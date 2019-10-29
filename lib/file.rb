require 'fileutils'
class Files
	def self.save_output(uname, pass, file_name)
		f = File.open("output/#{file_name}", "a")
		f << uname + ":" + pass
		f.close
	end
end