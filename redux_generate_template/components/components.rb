require 'mustache'

template =
%Q?import {Component, PropTypes} from 'react'
import {connect} from 'react-redux'

@connect(state => ({
  {{value}}: state.{{value}}
}))

export default class {{class_name}} extends Component {

  //保證物件有從外部傳來
  static propTypes = {
    actions: PropTypes.object.isRequired,
    {{value}}: PropTypes.{{type}}.isRequired
  }

  handleChange(e) {
    const {actions} = this.props

    actions.{{action}}(e.target.value)
  }

  render() {
    const { {{value}} } = this.props

    return (
      <p>
        <input onChange={::this.handleChange} value={ {{value}} } />{ {{value}} }
      </p>
    )
  }
}

?

class Components < Mustache
  def class_name
    ARGV[0].capitalize
  end

  def action
    ARGV[1]
  end

  def value
    ARGV[2]
  end

  def type
    value.class.to_s.downcase
  end

end

output = Components.render(template)

output_path = Dir.pwd
puts "Now in:" + output_path
puts "Create: #{ARGV[0].capitalize}.js 內容如下 \n"
puts "***********************************************"
puts output

File.open("#{output_path}/#{ARGV[0].capitalize}.js", 'w'){ |file| file.write(output) }

