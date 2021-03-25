require 'pry'
class Triangle
  # write code here
  attr_accessor :sides
  attr_reader :side_1, :side_2, :side_3
  @@all = []

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    self.class.all << self
  end

  def self.all
    @@all
  end

  def kind
    if triangle_inequality_test
      raise TriangleError
    elsif equilateral
      :equilateral
    elsif isosceles
      :isosceles
    elsif scalene
      :scalene
    end
  end

  class TriangleError < StandardError
  end

  private

  def triangle_inequality_test
    @sides = []
    @sides << self.side_1
    @sides << self.side_2
    @sides << self.side_3

    if @sides.all?{|side| side > 0}
      !(sides[0] + sides[1] > sides[2] && sides[0] + sides[2] > sides[1] && sides[1] + sides[2] > sides[0])
    else
      true
    end
  end
  
  def isosceles
    @sides.uniq.count == 2
  end

  def equilateral
    @sides.uniq.count == 1
  end

  def scalene
    @sides.uniq.count == 3
  end

end
