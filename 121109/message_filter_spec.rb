# encoding: utf-8
require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  before do
    @filter = MessageFilter.new('foo')
  end

  it "should detect message with NG word" do
    @filter.detected?('Hello from foo').should == true
  end

  it "should not detect message with NG word" do
    @filter.detected?('Hello, world!').should == false
  end
end
