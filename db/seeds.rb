puts ('Deleting data...')

Restaurant.destroy_all

puts 'start seeding restaurants'

10.times do
  Restaurant.create!(
    name: "#{Faker::Name.first_name} #{Faker::Restaurant.name }",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
end

puts 'end seeding'
