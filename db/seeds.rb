require 'faker'

#Create test user
test = User.new(
  name: 'Test User',
  email: 'test@example.com',
  password: 'helloworld'
  )

test.skip_confirmation!
test.save

#Create registered_applications
test_app = RegisteredApplication.new(
  user: test,
  name: 'Example App',
  URL: 'http://exampleapp.com'
  )

test_app.save

5.times do
  registered_application = RegisteredApplication.create!(
    user: test,
    name: Faker::App.name,
    URL: Faker::Internet.url
    )
end

registered_applications = RegisteredApplication.all

#Create events
50.times do
  event = Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Hacker.verb
    )
end

3.times do
  test_event = Event.new(
    registered_application: test_app,
    name: 'on-click'
    )
  test_event.save
end



puts "Seed finished"
puts "#{RegisteredApplication.count} applications created"
puts "#{Event.count} events created"
