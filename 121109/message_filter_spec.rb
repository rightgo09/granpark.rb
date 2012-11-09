# encoding: utf-8
require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  it "should detect message with NG word" do
    filter = MessageFilter.new('foo')
    filter.detected?('Hello from foo').should == true
  end

  it "should not detect message with NG word" do
    filter = MessageFilter.new('foo')
    filter.detected?('Hello, world!').should == false
  end
end
