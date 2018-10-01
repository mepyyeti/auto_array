#!/usr/bin/env ruby

#auto_array.rb

go = true
some_hash = {}
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
	
	print "the value of your array is #{some_array.inject(:+)}\n"
	some_hash[j]=some_array
	p some_hash
	print "\ndo you want to go again? [y/n]"
	input = gets.chomp.to_s
	
	if input == 'y' || input == 'yes'
		next
	else
		go = false
		print "\n goodbye\n"
		print some_array
	end
end
