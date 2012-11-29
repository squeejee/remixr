require_relative '../test_helper.rb'

class ClientTest < Test::Unit::TestCase
  include Remixr
  
  context "Searching for stores" do
    setup { @client = Remixr::Client.new('OU812') }
    
    should "find all stores" do
      stub_get '/stores?apiKey=OU812&format=json', 'stores.json'
      stores = @client.stores.fetch.stores
      stores.size.should == 10
      stores.first.name.should == 'Caguas'
    end
    
    should "find stores by postal code as option" do
      stub_get '/stores(postalCode=02184)?apiKey=OU812&format=json', 'stores_by_zip_02184.json'
      
      stores = @client.stores({'postalCode' => '02184'}).fetch.stores
      stores.size.should == 1
      stores.first.name.should == 'Braintree'
    end
    
    should "find stores in zip" do
      stub_get '/stores(postalCode=02184)?apiKey=OU812&format=json', 'stores_by_zip_02184.json'
      
      stores = @client.stores.in_zip('02184').fetch.stores
      stores.size.should == 1
      stores.first.name.should == 'Braintree'
    end
    
    should "find stores starting with zip" do
      stub_get '/stores(postalCode=021*)?apiKey=OU812&format=json', 'stores_starting_with_zip_021.json'
      
      stores = @client.stores.in_zip('021*').fetch.stores
      stores.size.should == 5
      stores.first.name.should == 'Back Bay'
    end
    
    should "find stores in a region" do
      stub_get '/stores(region=TX)?apiKey=OU812&format=json', 'stores_in_texas.json'
      
      stores = @client.stores.in_region('TX').fetch.stores
      stores.size.should == 10
      stores.first.name.should == 'Lake Charles'
    end
    
    should "find stores within a radius of a postal code" do
      stub_get '/stores(area(76227,50))?apiKey=OU812&format=json', 'stores_within_50_of_76227.json'
      
      stores = @client.stores({'area' => [76227,50]}).fetch.stores
      stores.size.should == 10
      stores.first.name.should == 'Denton'
    end
    
    should "find stores matching a given list of store IDs" do
      stub_get '/stores(storeId%20in(307,281,612))?apiKey=OU812&format=json', 'stores_in_list.json'
      
      stores = @client.stores({'storeId' => {'$in' => [307,281,612]}}).fetch.stores
      stores.size.should == 3
      stores.first.name.should == 'Richfield'
    end
    
  end
  
  context "Searching for products" do
    setup { @client = Remixr::Client.new('OU812') }
    
    should "find all products" do
      stub_get '/products?apiKey=OU812&format=json', 'products.json'
      products = @client.products.fetch.products
      products.size.should == 10
      products.first.sku.should == 7000032
    end
    
    
    should "find all products with sale price greater than twenty dollars" do
      stub_get '/products(salePrice%3E20)?apiKey=OU812&format=json', 'products_over_20_bucks.json'
      products = @client.products({'salePrice' => {'$gt' => 20}}).fetch.products
      products.size.should == 10
      products.first.sku.should == 16306454
    end
    
    should "find all products with based on search string" do
      stub_get '/products(search=digital%20photo%20printer)?apiKey=OU812&format=json', 'product_search_digital_photo_printer.json'
      products = @client.products({'search' => "digital photo printer"}).fetch.products
      products.size.should == 2
      products.first.sku.should == 4660432
    end  
    
  end
  
  context "When chaining product and store searches" do
    setup { @client = Remixr::Client.new('OU812') }
    
    should "return a products with nested stores" do
      stub_get '/products(salePrice%3E3000)+stores(area(76227,50))?apiKey=OU812&format=json', 'products_over_3k_within_50_miles.json'
      results = @client.products({'salePrice' => {'$gt' => 3000}}).stores({'area' => ['76227', 50]}).fetch
      results.should_respond_to(:products)
      results.should_not_respond_to(:stores)
      results.products.first.sku.should == 9234198
    end
  end
  
  context "When chaining store and product searches" do
    setup { @client = Remixr::Client.new('OU812') }
    
    should "return a products with nested stores" do
      stub_get '/stores(area(76227,50))+products(salePrice%3E3000)?apiKey=OU812&format=json', 'stores_within_50_miles_products_over_3k.json'
      results = @client.stores({'area' => ['76227', 50]}).products({'salePrice' => {'$gt' => 3000}}).fetch
      results.stores.first.name.should == 'Denton'
      results.stores.first.products.first.sku.should == 9234198
    end
  end
  
  context "When using the API" do
    
    setup { @client = Remixr::Client.new('OU812') }
    
    should "support paging" do
      stub_get '/stores?apiKey=OU812&format=json&page=20', 'stores_page_20.json'
      stores = @client.stores.fetch({:page => 20}).stores
      stores.size.should == 10
      stores.first.storeId.should == 282
    end
    
    should "support sorting" do
      stub_get '/stores?apiKey=OU812&format=json&page=20&sort=storeId.desc', 'stores_page_20_sort_by_store_id_desc.json'
      stores = @client.stores.fetch({:page => 20, :sort => {'storeId' => 'desc'}}).stores
      stores.size.should == 10
      stores.first.storeId.should == 1159
    end
    
    should "support limiting return fields" do
      stub_get '/products?apiKey=OU812&format=json&show=sku', 'products_skus_only.json'
      products = @client.products.fetch({:show => 'sku'}).products
      products.size.should == 10
      products.first.sku.should == 7000032
      products.first.format.should == nil
    end
    
  end
end