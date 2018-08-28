require 'rails_helper'

describe 'Students Index' do
  it 'shows user all Students' do
    student_1 = Student.create(name: "Jesse James")
    student_2 = Student.create(name: "Jessica Jones")

    visit students_path

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_2.name)
  end
  describe 'user can create a new student' do
    it 'should link to page where user makes new student' do

      visit students_path

      click_link "Add New Student"

      expect(current_path).to eq(new_student_path)

      fill_in "student[name]", with: "Janis Joplin"

      click_on "Create Student"

      expect(page).to have_content("Janis Joplin")
    end
  end
end
