# p "#{Dir.pwd}"
# p File.dirname(__FILE__)

mustache_path =  File.expand_path File.dirname(__FILE__)

output_path = mustache_path + "/output"
p "output_path: " + output_path

file_path = mustache_path + "/" +__FILE__[0..-4] + '/*'
p "file_path: " + file_path

#copy
`cp -r #{file_path} #{output_path}`

#create
actions_file = output_path + "/actions/actions.rb"
components_file = output_path + "/components/components.rb"
reducers_file = output_path + "/reducers/reducers.rb"


if $?.to_i==0
`ruby #{actions_file} #{ARGV[0]} #{ARGV[1]} #{ARGV[2]}`
`ruby #{components_file} #{ARGV[0].capitalize} #{ARGV[1]} #{ARGV[2]}`
`ruby #{reducers_file} #{ARGV[0]} #{ARGV[1]} #{ARGV[2]}`
end

#remove
if $?.to_i==0
`rm #{actions_file}`
`rm #{components_file}`
`rm #{reducers_file}`
end