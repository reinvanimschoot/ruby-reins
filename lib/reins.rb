# frozen_string_literal: true

require 'reins/dependencies'
require 'reins/controller'
require 'reins/routing'
require 'reins/util'
require 'reins/version'

module Reins
  class Application
    def initialize
      @root = __dir__
    end

    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      if env['PATH_INFO'] == '/'
        body = []

        begin
          home_controller = Object.const_get('HomeController')
          home_controller = home_controller.new(env)

          body = home_controller.send('index')
        rescue NameError
          index_file = @root + '/public/index.html'
          body = File.read(index_file)
        end

        return [200, { 'Content-Type' => 'text/html' }, [body]]
      end

      controller, action = get_controller_and_action(env)
      controller = controller.new(env)

      text = controller.send(action)

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end
end
