# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Projects" do
    describe "Admin" do
      describe "projects", type: :feature do
        refinery_login

        describe "projects list" do
          before do
            FactoryGirl.create(:project, :title => "UniqueTitleOne")
            FactoryGirl.create(:project, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.projects_admin_projects_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.projects_admin_projects_path

            click_link "Add New Project"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Projects::Project, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Projects::Project, :count)

              expect(page).to have_content("Title can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:project, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.projects_admin_projects_path

              click_link "Add New Project"

              fill_in "Title", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Projects::Project, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:project, :title => "A title") }

          it "should succeed" do
            visit refinery.projects_admin_projects_path

            within ".actions" do
              click_link "Edit this project"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).not_to have_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:project, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.projects_admin_projects_path

            click_link "Remove this project forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Projects::Project.count).to eq(0)
          end
        end

      end
    end
  end
end
