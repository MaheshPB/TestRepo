$LOAD_PATH << '.'
require "Edit_Contact"
require 'csv'
require 'fileutils'

class Home
	def homePage	
		puts "1. Search Contact"
		puts "2. Add Contact"
		puts "3. Edit Conact"
		puts "4. Delete Contact"
		puts "5. Sort"
		print "Enter your choice: "
		choice =  gets.chomp		
		case choice
			when "1"
				searchContact
			when "2"
				addContact
			when "3"
				Edit_Contact.edit
			when "4"
				deleteContact
			when "5"
				sort_contact				
		end
	end

	def addContact
		@test_regx
		@fname, @lname, @number = ""
		@street, @city, @state, @zip_code = ""
		@line_number = 1
		@record_flag = "N"
		# @line_count = 0
		#Read the content of file to get the total number of rows, if no rows found, then add the header line.
		file_data = []
		open("addNewContact.csv", "a+") do |i|
			if File.zero?("addNewContact.csv") then
				i << "lnno,fname,lname,contact,street,city,state,zipcode\n"
			end	
		end
		CSV.foreach("addNewContact.csv") {|row| file_data << row[0]}		
		if file_data.size == 1
			@line_number = 1
		else			
			file_data_size = file_data.size - 1			
			@line_number = file_data.size
		end
		 @line_number
		puts "Enter the first name"
		@fname = gets.chomp
		if (@fname !~ /[A-Z]/)
			exit
		end
		puts "Enter the last name"
		@lname = gets.chomp
		if (@fname !~ /[A-Z]/)
			exit
		end
		#Below code is to check if the record with same first name and last name exist, it is to avoid the duplicate records\
		#Begin
		search_critera = { 'fname' => @fname, 
                   'lname' => @lname }
		options = { :headers      =>  :first_row,
        		    :converters   =>  [ :numeric ] }
		matches = nil
		CSV.open( "addNewContact.csv", "r", options ) do |i|
	  		matches = i.find_all do |row|
	    		match = true    		
	    		search_critera.keys.each do |key|
	      			match = match && ( row[key] == search_critera[key] )
	    			if match == true
  						puts "Record exists"
  						exit
  					end
	    		end
	    		match
	  		end
  		end
  		#Above code is to check if the record with same first name and last name exist, it is to avoid the duplicate records\
		#End
		puts "Enter the contact number"
		@number = gets.chomp
		puts "Enter the street name"
		@street = gets.chomp
		if (@fname !~ /[A-Z]/)
			exit
		end
		puts "Enter the city"
		@city = gets.chomp
		if (@fname !~ /[A-Z]/)
			exit
		end
		puts "Enter the state"
		@state = gets.chomp
		if (@fname !~ /[A-Z]/)
			exit
		end
		puts "Enter the zip code"
		@zip_code = gets		
		open("addNewContact.csv", "a+") do |i|	
		t << [l, f, ln]		
		i << t.join(,)	
			i << "#{@line_number}" << "," << "#{@fname}" << "," << "#{@lname}" << "," << "#{@number}"<< "," << "#{@street}" << "," << "#{@city}" << "," << "#{@state}" << "," << "#{@zip_code}"
		end		
	end

	def searchContact		
		@flag = 0
		puts "Enter the first name:"
		fname = gets.chomp
		puts "Enter the last name:"
		lname = gets.chomp
		search_critera = { 'fname' => fname, 
                   'lname' => lname }

		options = { :headers      =>  :first_row,
        		    :converters   =>  [ :numeric ] }
		matches = nil
		CSV.open( "addNewContact.csv", "r", options ) do |i|
  		matches = i.find_all do |row|
    		match = true
    		@flag = 1
    		search_critera.keys.each do |key|
      			match = match && ( row[key] == search_critera[key] )
    		end
    		match
  		end
  		
		end
		if @flag != 1
  			puts "\nContact not found"
  		end
		matches.each do |row|
	  		row1 = row[1]
	  		row2 = row[2]
	  		row3 = row[3]
	  		row4 = row[4]
	  		row5 = row[5]
	  		row6 = row[6]
	  		row7 = row[7]
		  	
		  	puts "\nFirst name	: #{row1}"
			puts "Last Name	: #{row2}"
			puts "Contact Number	: #{row3}"
			puts "Street Name	: #{row4}"
			puts "City		: #{row5}"
			puts "State		: #{row6}"
			puts "Zip Code 	: #{row7}"
		end
	end

	def deleteContact
		file_data = []		
		# @delete_flag

		puts "Enter the first name:"
		fname = gets.chomp
		puts "Enter the last name:"
		lname = gets.chomp
		search_critera = { 'fname' => fname, 
                   'lname' => lname }

		format_sprcifiers = { :headers      =>  :first_row,
        		    		  :converters   =>  [ :numeric ] }
		matches = nil
		@counter = 0
		delete_match = Array.new
		delete_row = CSV.table("addNewContact.csv")
		delete_row.delete_if do |row|
			# puts "are you sure to delete the contact ? y/n"
			# @delete_flag = gets.chomp
			# if @delete_flag == "y"
		  		row[:fname] == fname && row[:lname] == lname
		  	# else
		  	# 	exit
		  	# end
		end	

		File.open("addNewContact.csv", 'w') do |f|
		  f.write(delete_row.to_csv)
		  f << nil
		end

		#If there are no records in the file, then clean up the extra spaces and new lines
		CSV.foreach("addNewContact.csv") {|row| file_data << row[0]}
		# puts file_data.size
		if file_data.size <= 2
			File.open("addNewContact.csv", 'w+')
		end	
	end

	def sort_contact
		number_of_rows = []
		@counter = 0
		@new_line_count = 0
		arr = Array.new
		array_header = Array["lnno","fname","lname","contact","street","city","state","zipcode"]				
		CSV.foreach("addNewContact.csv") {|row| number_of_rows << row[0]}				
		sort_data = CSV.read "addNewContact.csv"		
		arr = sort_data.sort { |a, b| a[1] <=> b[1] } 
		CSV.open("addNewContact_sort.csv","w+") do |i|
		i << array_header
			while @counter != number_of_rows.size-1
		 		i << arr[@counter]
		 		@counter += 1
			end
			# puts "Counter #{@counter}"	
		end
	end
end

home = Home.new()
home.homePage