#!/usr/bin/env rake
require 'bundler/gem_tasks'

require 'rake'
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

require 'simplecov'
Rake::TestTask.new do |t|
  t.name = 'simplecov'
  t.loader = :direct
  t.libs.push 'test', 'spec', Dir.pwd
  t.test_files = FileList['{test,spec}/**/*_{test,spec}.rb']
  t.ruby_opts.push '-r', 'simplecov', '-e', 'SimpleCov.start'.inspect
end
