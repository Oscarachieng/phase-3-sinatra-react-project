require 'faker'
require 'rest-client'

puts "🌱 Seeding spices..."

# Seed your database here
products_url = RestClient.get "https://fakestoreapi.com/products"
prod_array = JSON.parse(products_url)

prod_array.each do |product|
    Product.create(
        title: product["title"],
        description: product["description"],
        price: product["price"],
        ratting: product["rating"]["rate"].to_f,
        category: product["category"],
        image_url: product["image"]
    )
end

reviews_url = RestClient.get "https://62e76b330e5d74566af3e785.mockapi.io/data"
reviews_array = JSON.parse(reviews_url)

reviews_array.each do |review|
  Review.create(
    comment: review["review_text"],
    product_id: rand(1..20),
    user_id: rand(21..40)
  )
end


  reviews_array.each do |user|
    User.create(
      name: user["profile_name"],
      email_address: Faker::Internet.email,
      location: user["review_country"]
    )
  end

 


puts "✅ Done seeding!"
