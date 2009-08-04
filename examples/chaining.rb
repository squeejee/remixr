Remixr.api_key = 'OU812' # get yours from http://remix.bestbuy.com/apps/register
client = Remixr::Client.new

# find stores within 50 miles of ZIP 76227 and products over three G's
stores = client.stores({:area => ['76227', 50]}).products({:salePrice => {'$gt' => 3000}}).fetch.stores
stores.first.products.first.shortDescription
#=> "ENERGY STAR Qualified 4 HDMI inputs; gray Touch of Color bezel; 16:9 aspect ratio"
