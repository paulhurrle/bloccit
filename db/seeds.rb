require 'random_data'

Post.find_or_create_by!(title: "This is my unique post title", body: "This is my unique post body")

Comment.find_or_create_by!(body: "This is my unique comment body", post_id: 51)

Advertisement.find_or_create_by!(title: "1st Advertisement", body: "I sell snozzcumbers", price: 500)

Question.find_or_create_by!(title: "1st Question", body: "What's your favorite animal?", resolved: true)

50.times do
    Question.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: false
    )
end

50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: 999
    )
end

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body:  RandomData.random_paragraph
    )
end
posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created"
puts "#{Question.count} questions created"
