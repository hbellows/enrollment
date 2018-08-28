require 'rails_helper'

describe 'Student Show' do
  describe 'user links to show page from index page' do
    it 'shows one student' do
      student_1 = Student.create(name: "Jesse James")
      student_2 = Student.create(name: "Jessica Jones")

      visit students_path

      click_link student_1.name

      expect(page).to have_content(student_1.name)
      expect(page).to_not have_content(student_2.name)
    end
  end
end
