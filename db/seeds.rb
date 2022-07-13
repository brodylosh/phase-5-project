# Athlete.destroy_all
# Collaborator.destroy_all
# Deal.destroy_all
# Application.destroy_all

sports = ["Basketball", "Baseball", "Softball", "Football", "Cross Country", "Field Hockey", "Bowling", "Golf", "Fencing", "Lacrosse", "Soccer", "Gymnastics", "Rowing", "Volleyball", "Hockey", "Water Polo", "Tennis", "Skiing", "Track and Field", "Swimming and Diving", "Wrestling"]
year = ["Recruit", "Freshman", "Sophomore", "Junior", "Senior", "Graduate"]
gender = ["Male", "Female", "Non-Binary"]

#Athletes

# Athlete.create(first_name: 'Brody', last_name: 'Losh', school: 'Michigan State University', sport: 'Basketball', year: 'Graduate', birthday: Date.today, gender: 'Male', bio: 'The G.O.A.T.', email: 'brodylosh@gmail.com', phone_number: '2481111111', username: 'brodylosh', password: 'BrodyLosh123!', athlete: true)
# Athlete.create(first_name: 'C.J.', last_name: 'Stroud', school: 'Ohio State University', sport: 'Football', year: 'Sophomore', birthday: Date.today, gender: 'Male', bio: 'OH-IO', email: 'cjstroud@gmail.com', phone_number: '6140000000', username: 'cjstroud', password: 'CJStroud123!', athlete: true)

25.times do
    Athlete.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, school: Faker::University.name, sport: sports.sample, year: year.sample, birthday: Faker::Date.birthday(min_age: 14, max_age: 30), gender: gender.sample, bio: Faker::Lorem.paragraph(sentence_count: 2), email: Faker::Internet.email(name: "#{:first_name}#{:last_name}", domain: 'gmail'), phone_number: Faker::PhoneNumber.cell_phone, username: "#{:first_name} #{:last_name}", password: "#{:first_name} #{:last_name}123!", athlete: true)
end

#Collaborators

Collaborator.create!(name: 'Ricks American Cafe', address: '224 Abbot Rd, East Lansing, MI 48823', remote: false, email: 'ricks@ricksamericancafe.com', phone_number: '(517) 351-2285', username: "ricksamericancafe", password: "RicksAmericanCafe123!")

15.times do
    Collaborator.create(name: Faker::Company.name, address: Faker::Address.full_address, remote: Faker::Boolean.boolean, email: Faker::Internet.email(name: "name", domain: 'gmail'), phone_number: Faker::PhoneNumber.cell_phone, username: "name", password: "Name123!")
end

#Deals

# Deal.create(collaborator_id: 1, athlete_id: 1, title: 'Autographs at Ricks', offer: 150, description: 'Seeking a male MSU basketball student-athlete to provide autographs at Ricks for 1 hour', school: 'Michigan State University', sport: 'Basketball', year: '', age: '', gender: 'Male', expiration_date: Faker::Date.forward(days: 10), location: '224 Abbot Rd, East Lansing, MI 48823', completed: false)

30.times do
    Deal.create(collaborator_id: Faker::Number.between(from: 1, to: 15), athlete_id: Faker::Number.between(from: 1, to: 25), title: Faker::Lorem.sentence, offer: Faker::Number.between(from: 1, to: 1000), description: Faker::Lorem.paragraph(sentence_count: 2), school: Faker::University.name, sport: sports.sample, year: year.sample, age: Faker::Number.between(from: 1, to: 30), gender: gender.sample, expiration_date: Faker::Date.between(from: 2.week.from_now, to: 7.week.from_now), location: Faker::Address.full_address, completed: false)
end

#Applications
