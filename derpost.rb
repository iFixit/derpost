#!/usr/bin/env ruby

MESSAGES_PER_PAGE = 10

def print_index(messages, page)
	pageStart = (page + 1) * MESSAGES_PER_PAGE
	if pageStart < messages.size
		messages[pageStart, MESSAGES_PER_PAGE].each_with_index do |message, index|
			puts "#{index+1}: #{message}"
		end
	else
		puts 'End of messages.'
	end
end

def print_message(messages, page, messageIndex)
	pageStart = (page + 1) * MESSAGES_PER_PAGE
	messageId = messages[pageStart+messageIndex-1].split[0]
	puts `postcat -q #{messageId}`
end

def print_help
	puts 'Available commands:'
	puts '    l      List messages in the current page.'
	puts '    n      View the next page of messages.'
	puts '    p      View the previous page of messages.'
	puts '    r <N>  Read message N.'
	puts '    h, ?   Display help (this page).'
	puts '    q      Quit.'
end

messages = `postqueue -p | sed 1d | lineify`.split "\n"
page = 1

print_index messages, page
while true
	print '[$]> '
	command = gets || (puts ; break) # Exit on end of input (ctrl-d).
	# .chr is necessary in Ruby 1.8, which otherwise converts to a Fixnum.
	case command[0].chr
	when 'l'
		print_index messages, page
	when 'n'
		page += 1
		print_index messages, page
	when 'p'
		page -= 1
		print_index messages, page
	when 'r'
		print_message messages, page, command.split[1].to_i
	when 'h'
		print_help
	when '?'
		print_help
	when 'q'
		break
	else
		puts "Unknown command #{command[0].chr}.  Enter 'h' for help."
	end
end

