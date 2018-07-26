require 'discordrb'

#Uncomment the line below and add your token where it says Your token inside the quotations.

#bot = Discordrb::Commands::CommandBot.new token: 'Your token', prefix: '`'

bot.command(:dice) do |event|
	a = rand 1..6
	event.respond a
end

bot.command(:lottery) do |event|
	l1 = rand 1..4
	l2 = rand 1..4
	l3 = rand 1..4
	event.respond "#{l1}, #{l2}, #{l3}"
	if l1 == l2 && l2 == l3
		event.respond 'Congratulations! You Won'
	else
		event.respond 'You Lost!'
	end
end


bot.command(:link) do |event|
	event.respond 'https://discordapp.com/api/oauth2/authorize?client_id=439295168848461824&permissions=8&scope=bot'
end

bot.command(:oof) do |event|
	event.channel.send_file(File.open('gopnik.jpeg', ))
end

#Insert your user id so that the bot will shut down only when the correct user activates the command

bot.command(:exit, help_available: false) do |event|
	#break unless event.user.id == Your user id

	bot.send_message(event.channel.id, 'I am shutting down, goodbye!')
	exit
end

bot.run
