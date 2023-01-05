require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create!(name: 'Tom', email: 'email@hmail.com', password: 'password')
    Food.create!(name: 'eggs', measurement_unit: 'grams', price: 10, user_id: @user.id)
  end
  before(:each) { subject.save }

  it 'should have name eggs' do
    expect(subject.name).to eql('eggs')
  end

  it 'should have price 10' do
    expect(subject.price).to eql(10)
  end
end
