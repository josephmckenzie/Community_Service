require 'csv'
require 'date'


def import_file_info
#input is a csv, output is new .csv file
	newfile = File.open('risk_factor_file.csv', "w")
		
		CSV.foreach ('Community_service_scrubbed.csv') do |row|
			if row[0] == "Name"
				header = row.join(",")
				newfile.print header << ",Hours Remaining,Days Remaining\n"
			else
				hours = hours_remaining(row)
				days = days_left(row, Date.today)
				risk = risk_factor(hours, days)
				row[7] = risk
				new = (row.push(hours, days)).join(",")
				newfile.print "#{new}\n"
			end
		end
	
	newfile.close
end


def hours_remaining(array)
#input is array, output is a float
		assigned = array[4].to_f
		completed = array[5].to_f
	
		remaining_hours = assigned - completed
 
end
def clean_date(row)
#input is .csv array, output is changed string in position 6, if applicable
	if row[6] == nil || (row[6].include? "?")
		row[6] = "1.1.70"
	end
	
	row
end

def days_left(row, date)
#input is an array of  strings coming from the .csv, output is an integer
	row_with_revised_date = clean_date(row)
	today = (date).to_s #format YYYY/MM/DD
	
	max_date = row[6] #formatted MM/DD/YYYY/
	
	modified_max_date_array = max_date.split(".")
		
	modified_max_date = modified_max_date_array[2] + "." + modified_max_date_array[0] + "." + modified_max_date_array[1]
			
	days = (Date.parse(modified_max_date)) - (Date.parse(today))
	
	days_left = days.to_i
end




def risk_factor(hours, days)
	#input two variables, output is a single variables
		
		if days == 0
			days = -1
		
		end
	risk = (hours / days).round(2)
		
end


import_file_info