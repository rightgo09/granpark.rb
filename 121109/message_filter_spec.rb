# encoding: utf-8
require 'rubygems'
require 'rspec'
require './message_filter'

describe MessageFilter, 'with argument "foo"' do
  subject { MessageFilter.new('foo') }

  it {
    should be_detected('Hello from foo')
  }

  it {
    should_not be_detected('Hello World!')
  }
end
