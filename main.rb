require './executor'

executor = Executor.new

if ARGV.empty? #For interactive command prompt
   puts 'Enter the commands (Type exit to terminate)'
   while((command = gets.chomp) != 'exit')
      executor.execute(command)
   end
else #For passing filename as a parameter at command prompt and read commands from file
   file_name = ARGV[0]
   file_content = File.open(file_name).read
   file_content.each_line do |command|
       executor.execute(command)
   end
end