require 'rake'
require 'rake/testtask'
require 'rubygems'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "rupture"
    s.summary = %Q{Clojure sequence functions for Ruby.}
    s.email = "code@justinbalthrop.com"
    s.homepage = "http://github.com/flatland/rupture"
    s.description = "Clojure sequence functions for Ruby."
    s.authors = ["Justin Balthrop"]
    s.add_dependency('hamster', '>= 0.4.2')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/**/*_test.rb']
    t.verbose = true
  end
rescue LoadError
end

task :default => :test
