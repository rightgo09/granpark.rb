#!/usr/bin/env ruby

line = STDIN.gets.chomp

line.gsub! /([^\s]+)/, "'\\1',"
line.gsub! /'\(',/, "["
line.gsub! /'\)',/, "],"
line.gsub! /,$/, ""

line = eval line

def poland(operator, operand1, operand2)
  digitizate = lambda do |operand|
    return poland(*operand) if operand.class == Array
    return operand
  end
  operand1 = digitizate.call(operand1)
  operand2 = digitizate.call(operand2)
  eval "#{operand1} #{operator} #{operand2}"
end

puts poland(*line)
