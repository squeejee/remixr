# remixr

The Ruby BestBuy [Remix API](http://remix.bestbuy.com/docs) gem. Remix is an API that gives you access to BestBuy.com's product catalog data and more. 

## Install

    sudo gem install remixr
 
## Usage

    Remixr.api_key = 'OU812' # get yours from http://remix.bestbuy.com/apps/register
    client = Remixr::Client.new
 
### Find stores

    # find stores within 50 miles of ZIP 76227
    stores = client.stores({:area => ['76227', 50]}).fetch.stores

    stores.first

    => {"city"=>"Denton", "longName"=>"Best Buy - Denton", "name"=>"Denton", "region"=>"TX", "address"=>"1800 S Loop 288, Ste 102 Bldg 1 ", "country"=>"US", "lng"=>-97.10067, "postalCode"=>"76205", "phone"=>"940-384-9581", "hours"=>"Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-10; Sat: 10-10; Sun: 11-8", "storeId"=>827, "fullPostalCode"=>"76205", "lat"=>33.192524, "distance"=>9.79}
 
 
### Find products

    # fetch first page of products on sale below 20 bucks
    products = client.products({:salePrice => {'$lt' => 20.00}}).fetch.products

    # fetch only SKU and salePrice 
    products = client.products({:salePrice => {'$lt' => 20.00}}).fetch.products
    
### Chaining

You can also chain `stores` and `products` to return stores and nested product info or vice versa

    # find stores within 50 miles of ZIP 76227 and products over three G's
    
    stores = client.stores({:area => ['76227', 50]}).products({:salePrice => {'$gt' => 3000}}).fetch.stores
    
    stores.first.products.first.shortDescription
    
    #=> "ENERGY STAR Qualified 4 HDMI inputs; gray Touch of Color bezel; 16:9 aspect ratio"

### Fetching

All calls terminate in a call to `fetch` which takes the following options

    :page - positive integer for page number
    :show - comma delimited string or array of field names to show
    :sort - hash or string of sort info {'fieldname' => 'asc|desc'}


### Conditional operators

We took a page out of [MongoDB's](http://www.mongodb.org/display/DOCS/Advanced+Queries#AdvancedQueries-ConditionalOperators%3A%3C%2C%3C%3D%2C%3E%2C%3E%3D) playbook and mapped conditional operators to text equivalents to avoid having these be keys to hashes:

    {:salePrice => {'$gte' => 300.00}}
    => salePrice > 300.00
    
    $gte - greater than or equal to : field > value
    $lte - less than or equal to : field > value
    $gt - greater than : field > value
    $lt - less than : field > value
    $ne - not equal to : field != value

More in the examples folder:

[http://github.com/squeejee/remixr/tree/master/examples](http://github.com/squeejee/remixr/tree/master/examples)

### Documentation

[http://rdoc.info/projects/squeejee/remixr](http://rdoc.info/projects/squeejee/remixr)

#### Copyright

Copyright (c) 2009 Squeejee. See LICENSE for details.
