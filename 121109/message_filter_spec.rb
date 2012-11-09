# encoding: utf-8
require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter do
  before do
    @filter = MessageFilter.new('foo')
  end

  it "should detect message with NG word" do
    @filter.should be_detected('Hello from foo')
  end

  it "should not detect message with NG word" do
    @filter.should_not be_detected('Hello World!')
  end
end
