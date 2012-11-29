require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name              = "remixr"
    gem.description       = %Q{wrapper for the BestBuy Remix api}
    gem.summary           = %Q{wrapper for the BestBuy Remix api}
    gem.email             = "wynn@squeejee.com"
    gem.homepage          = "http://github.com/squeejee/remixr"
    gem.authors           = ["Wynn Netherland", "Jim Mulholland"]
    gem.rubyforge_project = "remixr"
    gem.files             = FileList["[A-Z]*", "{examples,lib,test}/**/*"]
    
    gem.add_dependency('mash', '0.0.3')
    gem.add_dependency('httparty', '0.9')
    
    gem.add_development_dependency('thoughtbot-shoulda')
    gem.add_development_dependency('jeremymcanally-matchy')
    gem.add_development_dependency('mocha')
    gem.add_development_dependency('fakeweb')
    gem.add_development_dependency('mash')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end


task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "remixr #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'rake/contrib/sshpublisher'
  namespace :rubyforge do
    
    desc "Release gem and RDoc documentation to RubyForge"
    task :release => ["rubyforge:release:gem", "rubyforge:release:docs"]
    
    namespace :release do
      desc "Publish RDoc to RubyForge."
      task :docs => [:rdoc] do
        config = YAML.load(
            File.read(File.expand_path('~/.rubyforge/user-config.yml'))
        )

        host = "#{config['username']}@rubyforge.org"
        remote_dir = "/var/www/gforge-projects/remixr/rdoc"
        local_dir = 'rdoc'

        Rake::SshDirPublisher.new(host, remote_dir, local_dir).upload
      end
      
      # task :website do
      #   config = YAML.load(
      #       File.read(File.expand_path('~/.rubyforge/user-config.yml'))
      #   )
      # 
      #   host = "#{config['username']}@rubyforge.org"
      #   remote_dir = "/var/www/gforge-projects/remixr/"
      #   local_dir = 'website'
      #   
      #   Rake::SshDirPublisher.new(host, remote_dir, local_dir).upload
      # end
    end
  end
rescue LoadError
  puts "Rake SshDirPublisher is unavailable or your rubyforge environment is not configured."
end
