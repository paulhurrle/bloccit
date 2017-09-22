class SponsoredPostsController < ApplicationController
  def show
      @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def new
      @topic = Topic.find(params[:id])
      @sponsoredpost = SponsoredPost.new
  end

  def edit
      @sponsoredpost = SponsoredPost.find(params[:id])
  end

  def update
      @sponsoredpost = SponsoredPost.find(params[:id])
      @sponsoredpost.assign_attributes(post_params)

      if @sponsoredpost.save
          flash[:notice] = "Post was updated."
          redirect_to [@sponsoredpost.topic, @sponsoredpost]
      else
          flash.now[:alert] = "There was an error saving the post. Please try again."
          render :edit
      end
  end

  private

  def post_params
      params.permit(:title, :body, :price)
  end
end
