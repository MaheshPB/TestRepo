module Edit_Contact
	def Edit_Contact.edit
		@edit = ""
		@count = 0
		@newCount = 0
		@fname = ""
		@row1,@row2,@row3,@row4,@row5,@row6,@row7 = ""
		@row2 = ""
		@flag = 0
		puts "Enter the first name:"
		fname = gets.chomp
		puts "Enter the last name:"
		lname = gets.chomp
		search_critera = { 'fname' => fname, 
                   		   'lname' => lname }
		options = { :headers      =>  :first_row,
        		    :converters   =>  [ :numeric ] }
		# Save `matches` and a copy of the `headers`
		matches = nil
		# headers = nil
		# Iterate through the `csv` file and locate where
		# data matches the options.
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
  		# headers = csv.headers
  		end

		# Once matches are found, we print the results
		
		matches.each do |row|
	  		@row1 = row[1]
	  		@row2 = row[2]
	  		@row3 = row[3]
	  		@row4 = row[4]
	  		@row5 = row[5]
	  		@row6 = row[6]
	  		@row7 = row[7]
	  		
		  	puts "\nFirst name	: #{@row1} => 1"
			puts "Last Name	: #{@row2} => 2"
			puts "Contact Number	: #{@row3} => 3"
			puts "Street Name	: #{@row4} => 4"
			puts "City		: #{@row5} => 5"
			puts "State		: #{@row6} => 6"
			puts "Zip Code 	: #{@row7} => 7"
			# puts row8
			puts "Enter your choice to edit the specific field: "
			edit_choice = gets.chomp
			puts edit_choice
			case edit_choice
				when "1"
					puts "Enter the first name to be edited:"
					@fname = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'fname' => @fname}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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
					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@fname}" << "," << "#{@row2}" << ","<< "#{@row3}" << ","<< "#{@row4}" << ","<< "#{@row5}" << ","<< "#{@row6}" << ","<< "#{@row7}" << "\n"
					end	  	
					puts "First name edited"			
					##### Edit section for first name end

					##### Edit section for last name start
					when "2"
					puts "Enter the last name to be edited:"
					@lname = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'lname' => @lname}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@lname}" << ","<< "#{@row3}" << ","<< "#{@row4}" << ","<< "#{@row5}" << ","<< "#{@row6}" << ","<< "#{@row7}" << "\n"
					end	  	
					puts "Last name edited"			
				##### Edit section for last name end

				#####Begin section for contact number edit
				when "3"
					puts "Enter the contact number to be edited:"
					@contact = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'contact' => @contact}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@row2}" << ","<< "#{@contact}" << ","<< "#{@row4}" << ","<< "#{@row5}" << ","<< "#{@row6}" << ","<< "#{@row7}" << "\n"
					end	  
					puts "Contact number edited"
					##### Edit section for contact number end
					

					##### Edit section for street name end
				when "4"
					puts "Enter the name of the street to be edited:"
					@street = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'street' => @street}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@row2}" << ","<< "#{@row3}" << ","<< "#{@street}" << ","<< "#{@row5}" << ","<< "#{@row6}" << ","<< "#{@row7}" << "\n"
					end	  
					puts "Street name edited"				
				##### Edit section for street name end


				#####Begin section for City edit
				when "5"
					puts "Enter the name of the city to be edited:"
					@city = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'city' => @city}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@row2}" << ","<< "#{@row3}" << ","<< "#{@row4}" << ","<< "#{@city}" << ","<< "#{@row6}" << ","<< "#{@row7}" << "\n"
					end	
					puts "City name edited"  				
					##### Edit section for contact number end
					
				##### Edit section for street name begin
				when "6"
					puts "Enter the name of the state name to be edited:"
					@state = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'state' => @state}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@row2}" << ","<< "#{@row3}" << ","<< "#{@row4}" << ","<< "#{@row5}" << ","<< "#{@state}" << ","<< "#{@row7}" << "\n"
					end	  
					puts "State name edited"				
				##### Edit section for street name end
					
					
				##### Edit section for Zipcode begin
				when "7"
					puts "Enter the Zipcode to be edited:"
					@zipcode = gets.chomp
					##### Edit section for first name begin
					search_critera = { 'zipcode' => @zipcode}
					options = { :headers      =>  :first_row,
			        		    :converters   =>  [ :numeric ] }
					# Save `matches` and a copy of the `headers`
					matches = nil
					# headers = nil
					# Iterate through the `csv` file and locate where
					# data matches the options.
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

					#Delete the matching row and intert a new row with the edited field
				  	delete_row = CSV.table("addNewContact.csv")
					delete_row.delete_if do |row|
					  row[:fname] == fname && row[:lname] == lname
					end
					File.open("addNewContact.csv", 'w') do |f|
					  f.write(delete_row.to_csv)
					  f << "1" << "," << "#{@row1}" << "," << "#{@row2}" << ","<< "#{@row3}" << ","<< "#{@row4}" << ","<< "#{@row5}" << ","<< "#{@row6}" << ","<< "#{@zipcode}" << "\n"
					end	 
					puts "Zip Code edited" 				
					##### Edit section for street name end
					
			end
		
	 	end
	 end
end