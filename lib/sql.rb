require "sqlite3"
require 'logger'
require_relative 'logger'
require_relative 'file'
class SQL
	DB = SQLite3::Database.new "logins.DB"
	def self.sqlite(email, pass)
		begin
			# Open a database
			DB.execute("INSERT INTO login (user_name, pass) 
	           		VALUES (?, ?)", [email, pass])
		rescue => e
			Logger.log(e)
		end
	end
	def self.insert(file_name)
		begin
			#  each line in file is turned into an array
			File.readlines(file_name).each do |line|
				# email => 0
				# pass  => 1
				uname = line.split(":")[0]
				pass  = line.split(":")[1]
				puts ("Adding Username:" + uname)
				# Inserts into DB
				sqlite(uname, pass)
			end
		rescue => e
			Logger.log(e)
		end
	end
	def self.query_like(q, output, options=100)
		# Option => Limit the amount of records
		DB.execute( "select * from login where user_name LIKE '#{q}' LIMIT #{options};" ) do |row|
			Files.save_output(row[0], row[1], output)
		end
	end
	def self.query_username(q, output)
		# row[0] => user_name
		# row[1] => pass
		DB.execute( "select * from login where user_name = '#{q}'" ) do |row|
			puts "User_name: " + row[0]
			puts "Pass:      " + row[1]
			Files.save_output(row[0], row[1], output)
		end
	end
end
#2/Collection#1_BTC combos/1.txt"
#SQL.insert("2/Collection#1_BTC combos/0.txt")
#SQL.query_username("hogan7@mailondandan.com")
#SQL.query_like("%@gmail%")