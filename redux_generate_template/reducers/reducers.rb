require 'mustache'

template =
%Q?import * as types from '../actions/{{value}}'

export default function {{value}}(state = '', action) {
  //state是指先前的狀能
  //action是指action傳來的值
  switch (action.type) {
  case types.{{action_upcase}}_{{value_upcase}}:
    return action.{{value}}

  default:
    return state
  }
}
?

class Reducers < Mustache
  def action
    ARGV[1]
  end

  def value
    ARGV[2]
  end

  def action_upcase
    action.upcase
  end

  def value_upcase
    value.upcase
  end

end

output = Reducers.render(template)

output_path = File.expand_path File.dirname(__FILE__)
puts "Now in:" + output_path
puts "Create: #{ARGV[0]}.js 內容如下 \n"
puts "***********************************************"
puts output

File.open("#{output_path}/#{ARGV[0]}.js", 'w'){ |file| file.write(output) }