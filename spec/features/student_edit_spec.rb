require 'rails_helper'

describe 'Student Edit' do
  describe 'user click edit' do
    it 'should edit student and redirect to show' do
      student_1 = Student.create(name: "Jesse James")
      student_2 = Student.create(name: "Jessica Jones")

      visit student_path(student_2)

      click_link "Edit Student"

      expect(current_path).to eq(edit_student_path(student_2))

      fill_in "student[name]", with: "Janet Jackson"

      click_on "Update Student"

      expect(current_path).to eq(student_path(student_2))

      expect(page).to have_content("Janet Jackson")
      expect(page).to_not have_content("Jessica Jones")

    end
  end
end
