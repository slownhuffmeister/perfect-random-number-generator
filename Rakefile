# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "perfect-random-number-generator"
  gem.homepage = "http://github.com/slownhuffmeister/perfect-random-number-generator"
  gem.license = "MIT"
  gem.summary =  "The best random number generator ever created"
  gem.description = "The best random number generator ever created"
  gem.email = "i4evaSloown@aol.com"
  gem.authors = ["Slown Huffmeister"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

desc "Code coverage detail"
  task :simplecov do
    ENV['COVERAGE'] = "true"
    Rake::Task['spec'].execute
  end

task :default => :test

require 'yard'
YARD::Rake::YardocTask.new
