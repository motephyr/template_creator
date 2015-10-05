# p "#{Dir.pwd}"
# p File.dirname(__FILE__)

mustache_path =  File.expand_path(File.dirname(__FILE__),'/')

output_path = Dir.pwd

file_path = __FILE__[0..-4] + '/'
p "file_path: " + file_path

actions_file = output_path + "/actions/actions.rb"
components_file = output_path + "/components/components.rb"
reducers_file = output_path + "/reducers/reducers.rb"

file_array = Dir.glob(file_path+ '*').map do | file |
  file.slice!(file_path)
  file
end
p file_array
file_array.each do |name|

  # create file strecutre (if not exist)
  `mkdir #{name}`
  #create file
p "#{output_path}/#{name}"
  # `cd #{output_path}/#{name};ruby #{file_path}/#{name}/#{name}.rb #{ARGV[0]} #{ARGV[1]} #{ARGV[2]}`
end



#create
if $?.to_i==0
# `ruby #{actions_file} #{ARGV[0]} #{ARGV[1]} #{ARGV[2]}`
# `ruby #{components_file} #{ARGV[0].capitalize} #{ARGV[1]} #{ARGV[2]}`
# `ruby #{reducers_file} #{ARGV[0]} #{ARGV[1]} #{ARGV[2]}`
end

#remove
if $?.to_i==0
# `rm #{actions_file}`
# `rm #{components_file}`
# `rm #{reducers_file}`
end