class PagesController < ApplicationController
  def home
    @posts = Post.order(updated_at: :desc).limit(10)
  end
end
