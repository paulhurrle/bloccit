require 'random_data'

#Post.find_or_create_by!(title: "This is my unique post title", body: "This is my unique post body")

#Comment.find_or_create_by!(body: "This is my unique comment body", post_id: 51)

#Advertisement.find_or_create_by!(title: "1st Advertisement", body: "I sell snozzcumbers", price: 500)

#Question.find_or_create_by!(title: "1st Question", body: "What's your favorite animal?", resolved: true)

# Create users
5.times do
    User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end
users = User.all

# Create topics
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all

# Create posts
50.times do
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body:  RandomData.random_paragraph,
    )
end
posts = Post.all

# Create sponsored posts
25.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: 9999
    )
end
sp_posts = SponsoredPost.all

# Create post comments
100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end
=begin
# Create sponsored post comments
100.times do
    Comment.create!(
        post: sp_posts.sample,
        body: RandomData.random_paragraph
    )
end
=end
# Create questions
50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
    )
end

# Create advertisements
50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: 999
    )
end

user = User.first
user.update_attributes!(
    email: 'paul_hurrle@yahoo.com',
    password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{SponsoredPost.count} sponsored posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
