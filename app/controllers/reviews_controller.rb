class ReviewsController < ApplicationController
  def create
    @restaurant = find_restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_restaurant
    Restaurant.find(params[:restaurant_id])
  end
end
