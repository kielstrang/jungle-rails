class ReviewsController < ApplicationController
  before_action :authorize

  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user

    if @review.save
      redirect_to @product
    else
      render template: 'products/show'
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    Review.find(params[:id]).destroy
    redirect_to @product
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
