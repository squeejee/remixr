# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{remixr}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland", "Jim Mulholland"]
  s.date = %q{2009-08-04}
  s.description = %q{wrapper for the BestBuy Remix api}
  s.email = %q{wynn@squeejee.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "History",
     "License",
     "Notes",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "examples/chaining.rb",
     "examples/find_products.rb",
     "examples/find_stores.rb",
     "lib/remixr.rb",
     "lib/remixr/client.rb",
     "test/fixtures/product_search_digital_photo_printer.json",
     "test/fixtures/products.json",
     "test/fixtures/products_over_20_bucks.json",
     "test/fixtures/products_over_3k_within_50_miles.json",
     "test/fixtures/products_skus_only.json",
     "test/fixtures/stores.json",
     "test/fixtures/stores_by_zip_02184.json",
     "test/fixtures/stores_in_list.json",
     "test/fixtures/stores_in_texas.json",
     "test/fixtures/stores_page_20.json",
     "test/fixtures/stores_page_20_sort_by_store_id_desc.json",
     "test/fixtures/stores_starting_with_zip_021.json",
     "test/fixtures/stores_within_50_miles_products_over_3k.json",
     "test/fixtures/stores_within_50_of_76227.json",
     "test/remixr/client_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/squeejee/remixr}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{remixr}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{wrapper for the BestBuy Remix api}
  s.test_files = [
    "test/remixr/client_test.rb",
     "test/test_helper.rb",
     "examples/chaining.rb",
     "examples/find_products.rb",
     "examples/find_stores.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mash>, ["= 0.0.3"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<mcmire-matchy>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<mash>, [">= 0"])
    else
      s.add_dependency(%q<mash>, ["= 0.0.3"])
      s.add_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<mcmire-matchy>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<mash>, [">= 0"])
    end
  else
    s.add_dependency(%q<mash>, ["= 0.0.3"])
    s.add_dependency(%q<httparty>, ["= 0.4.3"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<mcmire-matchy>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<mash>, [">= 0"])
  end
end
