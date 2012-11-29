require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'

# need rails for our tests to run
gem 'actionpack', '>= 3.0.0'
gem 'activesupport', '>= 3.0.0'
gem 'activemodel', '>= 3.0.0'
gem 'railties', '>= 3.0.0'

require 'action_controller/railtie'


FakeWeb.allow_net_connect = false

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'remixr'

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def remix_url(url)
  url =~ /^http/ ? url : "http://api.remix.bestbuy.com:80/v1#{url}"
end

def stub_get(url, filename, status=nil)
  options = {:body => fixture_file(filename)}
  options.merge!({:status => status}) unless status.nil?
  
  FakeWeb.register_uri(:get, remix_url(url), options)
end

def stub_post(url, filename)
  FakeWeb.register_uri(:post, remix_url(url), :body => fixture_file(filename))
end
