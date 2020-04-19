# frozen_string_literal: true

module Reins
  class Application
    def get_controller_and_action(env)
      before, controller, action, after = env['PATH_INFO'].split('/', 4)

      controller = controller.capitalize # People
      controller += 'Controller' # PeopleController

      [Object.const_get(controller), action]
    end
  end
end
