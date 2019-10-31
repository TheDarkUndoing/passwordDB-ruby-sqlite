# LeakCollection-organizer

### Installing the needed gems
```
gem install colorize
gem install sqlite3
```

### Importing the data
```ruby run.rb -i file_name_to_import.txt```<br>
It **ASSUMES** that the data is in the email:password format.


### Querying emails
```ruby run.rb -qu jake.mcgrath@gmail.com obama.txt```

### Using the like query
```ruby run.rb -ql %@gmail% obama.txt```
