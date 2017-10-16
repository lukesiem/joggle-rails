# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding Data ..."
include CloudinaryHelper

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
# unless Rails.env.development?
#   puts "Development seeds only (for now)!"
#   exit 0
# end

# Let's do this ...

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Apparel'
cat2 = Category.find_or_create_by! name: 'Electronics'
cat3 = Category.find_or_create_by! name: 'Furniture'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Shorts',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/Shorts_oanucl.jpg",
  quantity: 10,
  price: 64.99
})

cat1.products.create!({
  name:  'Summer Shirt',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/SummerShirt_ydncke.jpg",
  quantity: 18,
  price: 124.99
})

cat1.products.create!({
  name:  'Frozen Pod',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/pod_oocqjy.jpg",
  quantity: 4,
  price: 34.49
})

cat1.products.create!({
  name:  'Charles in Chard',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/charles_w5cxvx.jpg",
  quantity: 8,
  price: 25.00
})

cat1.products.create!({
  name:  'Employment',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/larger_nbpjhb.jpg",
  quantity: 8,
  price: 1_225.00
})

cat1.products.create!({
  name:  'Under Water Wifi',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/wifi_ljgpmi.jpg",
  quantity: 82,
  price: 224.50
})


cat2.products.create!({
  name:  'Birthday Mix',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/30_jkttvd.png",
  quantity: 40,
  price: 164.49
})

cat2.products.create!({
  name:  'Troemel Taco',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/taco_agehx1.jpg",
  quantity: 3,
  price: 26.00
})

cat2.products.create!({
  name:  'Taj Box',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/photo_kovwxm.jpg",
  quantity: 32,
  price: 2_026.29
})

cat3.products.create!({
  name:  'Art Historical Canon',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/canon_imctrf.jpg",
  quantity: 320,
  price: 3_052.00
})

cat3.products.create!({
  name:  'Branding the Individual/Ubiquitous Authorship, Jack Fisher',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/brand_qwl81u.jpg",
  quantity: 2,
  price: 987.65
})
cat3.products.create!({
  name:  'Modigliani On Couch, Arron Graham',
  description: Faker::Hipster.paragraph(4),
  image: "http://res.cloudinary.com/hyrcxwhtw/image/upload/v1508191799/stuff/couch_gqfkg4.jpg",
  quantity: 0,
  price: 2_483.75
})



puts "creating Users"
(20.times).each do 
  User.create({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8)
    })
end

Review.destroy_all


Review.create({product_id: 3, user_id: 1, rating:4, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 4, user_id: 1, rating:4, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 5, user_id: 1, rating:5, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 5, user_id: 1, rating:5, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 3, user_id: 1, rating:5, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 3, user_id: 2, rating:2, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 1, user_id: 2, rating:5, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 7, user_id: 2, rating:1, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 8, user_id: 2, rating:5, description: Faker::Hipster.paragraph(1)})
Review.create({product_id: 9, user_id: 2, rating:4, description: Faker::Hipster.paragraph(1)})

puts "Reviews DONE!"
