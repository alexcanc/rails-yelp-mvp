class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def new
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
    @review.destroy
    redirect_to @restaurant, notice: 'Review was successfully deleted.'
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review.restaurant, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
