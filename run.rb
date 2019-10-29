require 'colorize'
require_relative 'lib/leaks'
# turns the input into a array
args = ARGV.to_a
if args[0] == "-i"
	# check if args[1] is nil
	if args[1].nil?
		puts "ruby run.rb -i file_name_to_import.txt".red
		exit
	end
	# import the file you want to parse & add to sqlite
	# args[1] => file to be inserted into db
	SQL.insert(args[1])
elsif args[0] == "-qu"
	# check if args are nil
	if args[1].nil? || args[2].nil?
		puts "ruby run.rb -qu jake.mcgrath@gmail.com obama.txt".red
		exit
	end
	# args[1] => email address to be searched
 	# args[2] => output file
	SQL.query_username(args[1], args[2])
elsif args[0] == "-ql"
	# args[1] => q
	# args[2] => output
	if args[1].nil? || args[2].nil?
		puts 'ruby run.rb -ql %@gmail% obama.txt'.red
		exit
	end
	SQL.query_like(args[1], args[2])
end