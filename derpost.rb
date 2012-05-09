#!/usr/bin/env ruby

def print_index(messages, pageStart)
	if pageStart < messages.size
		messages[pageStart, 10].each_with_index do |message, index|
			puts "#{index+1}: #{message}"
		end
	else
		puts 'End of messages.'
	end
end

messages = `postqueue -p | sed 1d | ../lineify/lineify.rb`.split "\n"
pageStart = 0

print_index messages, pageStart
while true
	print '[$]> '
	command = gets
	case command[0]
	when 'n'
		pageStart += 10
		print_index messages, pageStart
	when 'q'
		break
	end
end

