# Generate Users
300.times do |i|
    User.create!(
        :account_name => Faker::Number.number(10),
        :email => Faker::Internet.user_name + '@127.0.0.1',
        :password => 'abc"123',
        :password_confirmation => 'abc"123'
    )
end