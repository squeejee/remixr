Remixr.api_key = 'OU812' # get yours from http://remix.bestbuy.com/apps/register
client = Remixr::Client.new

# find stores within 50 miles of ZIP 76227
stores = client.stores({:area => ['76227', 50]}).fetch.stores

stores.first
# => {"city"=>"Denton", "longName"=>"Best Buy - Denton", "name"=>"Denton", "region"=>"TX", "address"=>"1800 S Loop 288, Ste 102 Bldg 1 ", "country"=>"US", "lng"=>-97.10067, "postalCode"=>"76205", "phone"=>"940-384-9581", "hours"=>"Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-10; Sat: 10-10; Sun: 11-8", "storeId"=>827, "fullPostalCode"=>"76205", "lat"=>33.192524, "distance"=>9.79}



