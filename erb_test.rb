# frozen_string_literal: true

require 'erubis'

template = "Hello! Is it me you\'re looking for? I am <%= whatever %>."

eruby = Erubis::Eruby.new(template)
puts eruby.src
puts '==================='
puts eruby.result(whatever: 'Balthazar!')
