class ReviewsController < ApplicationController

  # check if user is logged in
  before_action :check_login, except: [:index, :show]

# List of Reviews/Home page
  def index
    # store the price in a variable
    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]

    # start with all the Reviews
    @reviews = Review.all

    # filter by price
    if @price.present?
      @reviews = @reviews.where(price: @price)
    end

    # filter by cuisine
    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine)
    end

    # search near the location
    if @location.present?
      @reviews = @reviews.near(@location)
    end

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

    # check if the model can be saved
    # if reviewed is saved, redirect to the homepage
    # if it isn't saved, then show the new review form
    if @review.save
      redirect_to root_path
    else
      #show the view for new.html.erb
      render "new", status: :unprocessable_entity
    end

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
    redirect_to root_path, status: :see_other
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
    if @review.update(form_params)
      #redirect to home
      redirect_to review_path(@review)

    else
      render "edit", status: :unprocessable_entity
    end
  end

  def form_params
    params.require(:review).permit(:title, :body, :score, :restaurant, :ambiance, :cuisine, :price, :address)
  end

end
