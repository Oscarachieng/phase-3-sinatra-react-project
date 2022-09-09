class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/products" do 
    products = Product.all.uniq
    products.to_json(only: [:id, :title, :description, :price, :ratting, :category, :image_url],
       include: {reviews: {only: [:id, :comment], include: :user}})
  end

  get "/products/:id" do 
    products = Product.find(params[:id])
    products.to_json(only: [:id, :title, :description, :price, :ratting, :category, :image_url],
       include: {reviews: {only: [:id, :comment], include: :user}})
  end
  
  get '/reviews' do 
    reviews = Review.complete_reviews
    reviews.to_json(include: :user)
  end

  get '/reviews/:id' do 
    reviews = Review.find(params[:id])
    reviews.to_json(include: {product: {only: [:title],include: :users}})
  end

  patch '/reviews/:id' do 
    review = Review.find(params[:id])
    review.update(
    comment: params[:comment],
    product_id: params[:product_id],
    user_id: params[:user_id]
  )
  review.to_json
  end

  post '/reviews' do 
    review = Review.create(
      comment: params[:comment],
      product_id: params[:product_id],
      user_id: params[:user_id]
    )
    review.to_json
  end

  get '/users' do 
    users = User.all.uniq
    users.to_json
  end

  get '/users/:id' do 
    users = User.find(params[:id])
    users.to_json
  end
  post '/users' do 
    new_user = User.create(
      name: params[:name],
      location: params[:location],
      email_address: params[:email]
    )
    new_user.to_json
  end

  get '/newsletters' do 
    newletters = NewsLetter.all.uniq
    newletters.to_json
  end

  get '/newsletters/:id' do 
    newletters = NewsLetter.find(params[:id])
    newletters.to_json
  end

  post '/newsletters' do 
    newletter = NewsLetter.create(
      email_address: params[:email]
    )
    newletter.to_json
  end
end
