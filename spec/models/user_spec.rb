require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a password and matching password_confirmation' do
    user = User.new(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is invalid when password and password_confirmation do not match' do
    user = User.new(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'differentpassword'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = User.new(
      email: 'test@example.com',
      password_confirmation: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid without a password_confirmation' do
    user = User.new(
      email: 'test@example.com',
      password: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid with a password shorter than the minimum length' do
    user = User.new(
      email: 'test@example.com',
      password: 'short',
      password_confirmation: 'short'
    )
    expect(user).to_not be_valid
  end

  it 'is valid with a password equal to the minimum length' do
    user = User.new(
      email: 'test@example.com',
      password: 'validpass',
      password_confirmation: 'validpass'
    )
    expect(user).to be_valid
  end

  it 'is valid with a password longer than the minimum length' do
    user = User.new(
      email: 'test@example.com',
      password: 'longpassword',
      password_confirmation: 'longpassword'
    )
    expect(user).to be_valid
  end

  it 'is invalid with a non-unique email (case-insensitive)' do
    existing_user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    user = User.new(
      email: 'test@example.com',
      password: 'differentpassword',
      password_confirmation: 'differentpassword'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = User.new(
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid without a first name' do
    user = User.new(
      email: 'test@example.com',
      last_name: 'Doe',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'is invalid without a last name' do
    user = User.new(
      email: 'test@example.com',
      first_name: 'John',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(user).to_not be_valid
  end

  it 'returns the user when provided with the correct credentials' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')
    expect(authenticated_user).to eq(user)
  end

  it 'returns nil when provided with incorrect password' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrongpassword')
    expect(authenticated_user).to be_nil
  end

  it 'returns nil when provided with an email not in the database' do
    authenticated_user = User.authenticate_with_credentials('nonexistent@example', 'password123')
    expect(authenticated_user).to be_nil
  end

  it 'returns the user when provided with an email with leading or trailing whitespace' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    authenticated_user = User.authenticate_with_credentials('  test@example.com  ', 'password123')
    expect(authenticated_user).to eq(user)
  end

  it 'returns the user when provided with an email with different letter case' do
    user = User.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    authenticated_user = User.authenticate_with_credentials('test@example.com', 'password123')
    expect(authenticated_user).to eq(user)
  end
end