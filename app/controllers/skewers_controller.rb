class SkewersController < ApplicationController
  before_filter :require_current_user!, only: [:new, :create, :destroy]

  def show
    @skewer = Skewer.find(params[:id]).includes(:skewer_posts)
  end

  def index
    @skewers = Skewer.all
  end

  def new
    @skewer = current_user.skewer.new
  end

  def create
    @skewer = current_user.skewer.new
  end

  def destroy
    @skewer = current_user.skewer
    @skewer.destroy
    redirect_to root_url
  end

end
