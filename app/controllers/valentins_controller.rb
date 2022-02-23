class ValentinsController < ApplicationController
  def index
    @valentins = Valentin.all
  end

  def show
    @valentin = Valentin.find(params[:id])
    @review = Review.new
    @reviews = @valentin.reviews
    @average_rating = @reviews.any? ? @reviews.average(:rating).round(2) : "No rating yet"
  end

  def new
    @valentin = Valentin.new
  end

  def destroy
    @valentin = Valentin.find(params[:id])
    @valentin.destroy
    redirect_to valentins_path
  end

  def create
    @valentin = Valentin.new(valentin_params)
    @valentin.user = current_user
    if @valentin.save
      redirect_to valentin_path(@valentin)
    else
      redirect_to new_valentin_path, alert: "fail"
    end
  end

  private

  def valentin_params
    params.require(:valentin).permit(:name, :price, :short_description, :long_description, :photo)
  end
end
