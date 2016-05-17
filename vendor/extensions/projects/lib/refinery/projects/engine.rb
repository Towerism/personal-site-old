module Refinery
  module Projects
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Projects

      engine_name :refinery_projects

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "projects"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.projects_admin_projects_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Projects)
      end
    end
  end
end
