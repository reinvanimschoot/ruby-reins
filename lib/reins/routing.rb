# frozen_string_literal: true

module Reins
  class Application
    def get_controller_and_action(env)
      before, controller, action, after = env['PATH_INFO'].split('/', 4)

      controller_prefix = controller.capitalize # People
      controller_name = "#{controller_prefix}Controller" # PeopleController

      controller_class = Object.const_get(controller_name)

      [controller_class, action]
    end
  end
end
