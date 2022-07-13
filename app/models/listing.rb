class Listing
  include Elasticsearch::Model 
  include Elasticsearch::Model::Callbacks
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :beds, type: Integer
  field :baths, type: Integer

  settings do
    mappings dynamic: false do
      indexes :beds, type: :integer
      indexes :baths, type: :integer
    end
  end

  validates_presence_of :beds, on: :create,  message: 'beds must be present'
  validates_presence_of :baths, on: :create,  message: 'baths must be present'
  validates_numericality_of :beds, greater_than: 0, message: 'Beds must be greater than Zero'
  validates_numericality_of :baths, greater_than: 0, message: 'Baths must be greater than Zero'

  # def self.search(search_params)
  #   Listing.search(
  #     index: "beds",
  #       body: {
  #         query: {
  #           range: {
  #               beds: {
  #                   gte: search_params[:min_beds],
  #                   lte: search_params[:max_beds]
  #               },
  #               baths: {
  #                   gte: search_params[:min_baths],
  #                     lte: search_params[:max_baths]
  #               }
  #           }
  #         }
  #       }
  #     )
  #   # Listing.where(:beds.gte => search_params[:min_beds]).and(:beds.lte => search_params[:max_beds]).and(:baths.gte => search_params[:min_baths]).and(:baths.lte => search_params[:max_baths])
  # end

end
