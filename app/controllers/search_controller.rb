class SearchController < ApplicationController
  def search
    if params[:min_beds].nil? && params[:min_baths].nil?
      @listings = []
    else
      @listings = Listing.search(
      index: "beds",
        body: {
          query: {
            range: {
                beds: {
                    gte: search_params[:min_beds],
                    lte: search_params[:max_beds]
                },
                baths: {
                    gte: search_params[:min_baths],
                      lte: search_params[:max_baths]
                }
            }
          }
        }
      )
    end
  end

  private

  def search_params
    params.permit(:min_beds, :max_beds, :min_baths, :max_baths)
  end
end
