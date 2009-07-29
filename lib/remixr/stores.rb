module Remixr
  class Stores
    include HTTParty
    base_uri 'api.remix.bestbuy.com'
    format :json
    
    def self.all(options={})
      results = get("/v1/stores", :query => Remixr.default_params.merge(options))
      results['stores'].flatten.map { |t| Mash.new(t) }
    end
    
    def self.by_zip(zip, options={})
      zip = zip.to_s
      results = get("/v1/stores(postalCode=#{zip})", :query => Remixr.default_params.merge(options))
      results['stores'].flatten.map { |t| Mash.new(t) }
    end
    
  end
end