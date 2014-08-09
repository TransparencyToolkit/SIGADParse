require 'json'

class SIGADParse
  def initialize(input, field)
    @input = JSON.parse(input)
    @field = field
  end

  def match
    matcharr = Array.new
    @input.each do |i|
      if i[@field]
        i[:sigads] = i[@field].scan(/(?:US|CA|UK|NZ|AU|DS|us|ca|uk|nz|au|ds)[a-zA-Z]?-\d(?:\w|-|\*){1,6}/)
        matcharr.push(i)
      end
    end
    JSON.pretty_generate(matcharr)
  end
end
