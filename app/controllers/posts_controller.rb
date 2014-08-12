class PostsController < ApplicationController
  before_filter :require_current_user, only: [:new, :destroy]

  
end
