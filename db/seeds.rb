require 'random_data'

Post.find_or_create_by!(title: "This is my unique post title", body: "This is my unique post body")

Comment.find_or_create_by!(body: "This is my unique comment body", post_id: 51)

Advertisement.find_or_create_by!(title: "1st Advertisement", body: "I sell snozzcumbers", price: 500)
Advertisement.find_or_create_by!(title: "2nd Advertisement", body: "I sell sprockets", price: 600)
Advertisement.find_or_create_by!(title: "3rd Advertisement", body: "I sell whizpoppers", price: 800)

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
