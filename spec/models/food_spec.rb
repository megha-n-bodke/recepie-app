require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    @user = User.create(name: 'Epaltechs', email: 'epal@mail.com', password: 'password')
    Food.create(name: 'Corn', measurement_unit: 'grams', price: 2, user: @user)
  end
  before(:each) { subject.save }

  it 'should have name corn' do
    expect(subject.name).to eql('Corn')
  end

  it 'should have price 2' do
    expect(subject.price).to eql(2)
  end
end
