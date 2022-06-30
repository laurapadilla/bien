class ReviewsController < ApplicationController

# List of Reviews
  def index
    # this is our list page for our reviews
    @reviews = Review.all
  end

# New review
  def new
    # the form for adding a new review
    # use the Review model that we created with `$ rails generate model Review`
    @review = Review.new
  end

# Create a review
  def create
    # take info from form and add it to the database
    @review = Review.new(form_params)

    # save form info to the database
    @review.save

    # redirect back to home page
    redirect_to root_path
  end

# Individual review page
  def show
    #find the review id in the database
    @review = Review.find(params[:id])
  end

  # Delete review

  def destroy
    # find individual review to destroy
    @review = Review.find(params[:id])

    # destroy
    @review.destroy

    # redirect to homepage
    redirect_to root_path
  end

  # Edit review
  def edit
    # find individual review to edit
    @review = Review.find(params[:id])
  end

  # Update review
  def update
    # find individual review to edit
    @review = Review.find(params[:id])

    # update with new info
    @review.update(form_params)

    #redirect to home
    redirect_to review_path(@review)
  end

  def form_params
    params.require(:review).permit(:title, :body, :score)
  end

end
