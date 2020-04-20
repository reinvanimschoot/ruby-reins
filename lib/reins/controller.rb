# frozen_string_literal: true

require 'erubis'

module Reins
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      # puts instance_variables

      filename = File.join 'app', 'views', controller_name, "#{view_name}.html.erb"
      template = File.read filename

      instance_variable_hash = {}

      instance_variables.each do |variable_name|
        instance_variable_hash[variable_name] = instance_variable_get variable_name
      end

      puts instance_variable_hash

      eruby = Erubis::Eruby.new(template)
      puts eruby.src
      eruby.result locals.merge(env: env).merge(instance_variable_hash)
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub /Controller$/, ''
      Reins.to_underscore klass
    end
  end
end
