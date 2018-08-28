require 'rails_helper'

describe 'Students Index' do
  it 'shows user all Students' do
    student_1 = Student.create(name: "Jesse James")
    student_2 = Student.create(name: "Jessica Jones")

    visit students_path

    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_2.name)
  end
end
