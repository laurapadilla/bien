class BookmarksController < ApplicationController

  before_action :check_login

  def create
    # find the review we're bookmarking
    @review = Review.find(params[:review_id])

    @bookmark = @review.bookmarks.new
    @bookmark.user = @current_user

    @bookmark.save

    # go back to review page
    redirect_to review_path(@review), status: :see_other

  end

  def destroy
    @review = Review.find(params[:review_id])

    @review.bookmarks.where(user: @current_user).delete_all

    redirect_to review_path(@review), status: :see_other
  end

end
