# frozen_string_literal: true

require 'reins/routing'
require 'reins/version'

module Reins
  class Application
    @root = __dir__

    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      if env['PATH_INFO'] == '/'
        index_file = @root + 'public/index.html'

        return [200, { 'Content-Type' => 'text/html' }, [File.read(index_file)]
      end

      controller, action = get_controller_and_action(env)
      controller = controller.new(env)

      text = controller.send(action)

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end
