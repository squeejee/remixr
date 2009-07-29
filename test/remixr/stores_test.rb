require File.dirname(__FILE__) + '/../test_helper'

class StoresTest < Test::Unit::TestCase
  include Remixr
  
  context "Getting all stores" do
    should "work" do
      stub_get '/v1/stores?apiKey=OU812&format=json', 'stores.json'
      Remixr.api_key = 'OU812'
      stores = Remixr::Stores.all
      stores.size.should == 10
      stores.first.name.should == 'Caguas'
    end
    
  end
  
  context "Getting stores by zip" do
    should "work" do
      stub_get '/v1/stores(postalCode=02184)?apiKey=OU812&format=json', 'stores_by_zip_02184.json'
      Remixr.api_key = 'OU812'
      stores = Remixr::Stores.by_zip("02184")
      stores.size.should == 1
      stores.first.name.should == 'Braintree'
    end
    
  end
end