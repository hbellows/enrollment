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
    it 'can delete a student' do
      student_1 = Student.create(name: "Jesse James")
      student_2 = Student.create(name: "Jessica Jones")

      visit student_path(student_1)

      click_link "Delete Student"

      expect(current_path).to eq(students_path)

      expect(page).to have_content(student_2.name)
      expect(page).to_not have_content(student_1.name)
    end
    it 'can show all addresses associated with the student' do
      student = Student.create(name: "Jessica Jones")

      address_1 = student.addresses.create(description: "home", street_address: "123 happy drive", city: "Denver", state: "CO", zip_code: 10101)
      address_2 = student.addresses.create(description: "mom", street_address: "123 sleepy blv", city: "Littleton", state: "CO", zip_code: 20202)

      visit student_path(student)

      expect(page).to have_content(address_1.description)
      expect(page).to have_content(address_1.street_address)
      expect(page).to have_content(address_1.city)
      expect(page).to have_content(address_1.state)
      expect(page).to have_content("Zip: #{address_1.zip_code}")
      expect(page).to have_content(address_2.description)
      expect(page).to have_content(address_2.street_address)
      expect(page).to have_content(address_2.city)
      expect(page).to have_content(address_2.state)
      expect(page).to have_content("Zip: #{address_2.zip_code}")
    end
  end
end
