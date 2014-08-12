class PostsController < ApplicationController
  before_filter :require_current_user, only: [:new, :destroy]

  def new
    @post = current_user.user_posts.new
  end
end
