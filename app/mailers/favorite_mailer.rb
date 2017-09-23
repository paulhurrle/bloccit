class FavoriteMailer < ApplicationMailer
    default from: "paul_hurrle@yahoo.com"

    def new_comment(user, post, comment)
        headers["Message-ID"] = "<comments/#{comment.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @user = user
        @post = post
        @comment = comment

        mail(to: user.email, subject: "new comment on #{post.title}", cc: 'paulnicolahurrle@gmail.com')
    end

    def new_post(post)
        headers["Message-ID"] = "<posts/#{post.id}@your-app-name.example>"
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"

        @post = post
        mail(to: post.user.email, subject: "Your post #{post.title} has been favorited!", cc: 'paulnicolahurrle@gmail.com')
    end
end
