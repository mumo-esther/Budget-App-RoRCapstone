require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Rida Arif', email: 'example@mail.com', password: 'password')
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'Rida Arif'
    expect(subject).to be_valid
  end

  it 'should return role user' do
    expect(subject.role).to eq 'user'
  end
end
