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

def print_message(messages, pageStart, messageIndex)
	messageId = messages[pageStart+messageIndex-1].split[0]
	puts `postcat -q #{messageId}`
end

messages = `postqueue -p | sed 1d | ../lineify/lineify.rb`.split "\n"
pageStart = 0

print_index messages, pageStart
while true
	print '[$]> '
	command = gets
	case command[0]
	when 'l'
		print_index messages, pageStart
	when 'n'
		pageStart += 10
		print_index messages, pageStart
	when 'r'
		print_message messages, pageStart, command.split[1].to_i
	when 'q'
		break
	end
end

