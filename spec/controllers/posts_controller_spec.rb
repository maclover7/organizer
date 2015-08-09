require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the index template" do
      post = FactoryGirl.create(:post)
      get :show, id: post.id
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      post = FactoryGirl.create(:post)
      get :edit, id: post.id
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post :create, post: FactoryGirl.attributes_for(:post)
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "does not create a new post" do
        expect {
          post :create, post: FactoryGirl.attributes_for(:post, name: nil)
        }.to change(Post, :count).by(0)

        expect {
          post :create, post: FactoryGirl.attributes_for(:post, body: nil)
        }.to change(Post, :count).by(0)
      end

      it "renders the edit template" do
        post :create, post: FactoryGirl.attributes_for(:post, name: nil)
        expect(response).to render_template("new")

        post :create, post: FactoryGirl.attributes_for(:post, body: nil)
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested post" do
        post = FactoryGirl.create(:post)
        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, name: "test")
        post.reload
        expect(post.name).to eq("test")
      end

      it "redirects to the post" do
        post = FactoryGirl.create(:post)
        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, name: "test")
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "does not update the requested post" do
        post = FactoryGirl.create(:post)
        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, name: nil)
        expect(post.name).to_not eq(nil)

        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, body: nil)
        expect(post.body).to_not eq(nil)
      end

      it "renders the edit template" do
        post = FactoryGirl.create(:post)
        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, name: nil)
        expect(response).to render_template("edit")

        put :update, id: post.id, post: FactoryGirl.attributes_for(:post, body: nil)
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, id: post.id
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = FactoryGirl.create(:post)
      delete :destroy, id: post.id
      expect(response).to redirect_to(posts_url)
    end
  end

end
