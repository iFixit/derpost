#!/usr/bin/env ruby

messages = `postqueue -p | sed 1d | ../lineify/lineify.rb`.split "\n"
pageStart = 0

while true
	if pageStart < messages.size
		messages[pageStart, 10].each_with_index do |message, index|
			puts "#{index+1}: #{message}"
		end
	else
		puts 'End of messages.'
	end
	
	print '[$]> '
	case gets[0]
	when 'n'
		pageStart += 10
	when 'q'
		break
	end
end

