require 'rails_helper'

describe Student, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end
end
