module Refinery
  module Projects
    module Admin
      class ProjectsController < ::Refinery::AdminController

        crudify :'refinery/projects/project'

        private

        # Only allow a trusted parameter "white list" through.
        def project_params
          params.require(:project).permit(:title, :link, :link_text, :description)
        end
      end
    end
  end
end
