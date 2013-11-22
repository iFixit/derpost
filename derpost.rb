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

def print_help
	puts 'Available commands:'
	puts '    l      List messages in the current page.'
	puts '    n      View the next page of messages.'
	puts '    r <N>  Read message N.'
	puts '    h, ?   Display help (this page).'
	puts '    q      Quit.'
end

messages = `postqueue -p | sed 1d | lineify`.split "\n"
pageStart = 0

print_index messages, pageStart
while true
	print '[$]> '
	command = gets
	# .chr is necessary in Ruby 1.8, which otherwise converts to a Fixnum.
	case command[0].chr
	when 'l'
		print_index messages, pageStart
	when 'n'
		pageStart += 10
		print_index messages, pageStart
	when 'r'
		print_message messages, pageStart, command.split[1].to_i
	when 'h'
		print_help
	when '?'
		print_help
	when 'q'
		break
	end
end

