require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Run Tests!'
Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'spec'
  system 'ruby spec/*_spec.rb'
end

task default: :test
