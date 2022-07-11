class SearchController < ApplicationController
  def search
    if params[:min_beds].nil? && params[:min_baths].nil?
      @listings = []
    else
      @listings = Listing.where(:beds.gte => params[:min_beds]).and(:beds.lte => params[:max_beds]).and(:baths.gte => params[:min_baths]).and(:baths.lte => params[:max_baths])
    end
  end
end
