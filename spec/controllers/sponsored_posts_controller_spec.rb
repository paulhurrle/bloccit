require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:sp_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 999) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(response).to render_template :show
    end

    it "assigns sp_post to @post" do
      get :show, topic_id: my_topic.id, id: sp_post.id
      expect(assigns(:post)).to eq(sp_post)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id, id: sp_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id, id: sp_post.id
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new, topic_id: my_topic.id, id: sp_post.id
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: sp_post.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
        get :edit, topic_id: my_topic.id, id: sp_post.id
        expect(response).to render_template :edit
    end

    it "assigns sp_post to be updated to @post" do
        get :edit, topic_id: my_topic.id, id: sp_post.id

        post_instance = assigns(:post)
        expect(post_instance.id).to eq sp_post.id
        expect(post_instance.title).to eq sp_post.title
        expect(post_instance.body).to eq sp_post.body
    end
  end
end
