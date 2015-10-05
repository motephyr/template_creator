require 'mustache'

template =
%Q?export const {{action_upcase}}_{{value_upcase}} = '{{action_upcase}}_{{value_upcase}}'

export function {{action}}() {
  return {
    type: {{action_upcase}}_{{value_upcase}}
  }
}
?

class Actions < Mustache
  def action
    ARGV[1]
  end

  def value_upcase
    ARGV[2].upcase
  end

  def action_upcase
    action.upcase
  end

end

output = Actions.render(template)

output_path = File.expand_path File.dirname(__FILE__)
puts "Now in:" + output_path
puts "Create: #{ARGV[0]}.js 內容如下 \n"
puts "***********************************************"
puts output

File.open("#{output_path}/#{ARGV[0]}.js", 'w'){ |file| file.write(output) }