class SearchController < ApplicationController
  def search
    if params[:min_beds].nil? && params[:min_baths].nil?
      @listings = []
    else
      @listings = Listing.search(search_params)
    end
  end

  private

  def search_params
    params.permit(:min_beds, :max_beds, :min_baths, :max_baths)
  end
end
