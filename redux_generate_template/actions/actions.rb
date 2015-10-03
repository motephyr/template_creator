require 'mustache'

template =
%Q?export const {{action}}_{{value}} = '{{action}}_{{value}}';

export function {{action_downcase}}() {
  return {
    type: {{action}}_{{value}}
  };
}
?

class Actions < Mustache
  def action
    ARGV[1]
  end

  def value
    ARGV[2]
  end

  def action_downcase
    action.downcase
  end

end

output = Actions.render(template)

puts "Now in:" + Dir.pwd
puts "Create: #{ARGV[0]}.js"
puts output

File.open("#{ARGV[0]}.js", 'w'){ |file| file.write(output) }