#!/usr/bin/env ruby
puts "Running gitdown!" 
#$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
# require 'jeweler/generator'
exit Gitup::gitup!(*ARGV)