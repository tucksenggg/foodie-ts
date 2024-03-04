class ListingsController < ApplicationController
  def index
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    @listing.save!
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :address, :rating, :cuisine, images: [])
  end
end
