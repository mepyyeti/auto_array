#!/usr/bin/env ruby

#auto_array.rb

go = true
some_hash = {}
sums_hash = Hash.new
biggest_array = Array.new
j=0
while go
	some_array=[]
	j+=1
	i=0
	
	until i >= 23
		i+=1
		s = rand(100)+1
		some_array.push(s)
		print "added #{s} ...\n"
	end
	
	total_value = some_array.inject(:+)
	print "the value of run #{j}: #{total_value}\n"
	some_array.sort!
	biggest = some_array[-1]
	print"largest value in run #{j}: #{biggest}"
	
	#some_array.insert(0, total_value)
	some_hash[j]=some_array
	sums_hash[j]=total_value
	
	#ensure j > 9 won't affect result summation
	if j > 9
		biggest_num_and_run = biggest + (j/100.to_f)
	else
		biggest_num_and_run = biggest + (j/10.to_f)
	end
	
	biggest_array.push(biggest_num_and_run)
	print "\nSUMMARY: RUN # | VAL"
	sums_hash.each do |key,value|
		print "\n\t   #{key} => #{value}\n"
		end
	#a.sort_by { |h| -h[:bar] }
	#sort_by doesn't work!!!
	#workaround is an array
	biggest_array.sort!
	print "biggest overall value: #{biggest_array[-1]} <-- run"
	print "\ndo you want to go again? [y/n]"
	input = gets.chomp.to_s
	
	if input == 'y' || input == 'yes'
		next
	else
		go = false
		print "\n goodbye\n"
		print some_array
	end
	
	print "Do you want to write this data? [y/n]"
	input = gets.chomp.to_s
	
	if input == 'y' || input == 'yes'
		data_writer = File.new("data_file.txt","w+")
		data_writer.write(sums_hash)
		data_writer.close
		
		data_reader = File.open("data_file.txt")
		
		data_reader.each do |d|
			print d
			end
	else
		print "goodbye..."
	end
end
