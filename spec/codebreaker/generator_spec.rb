require File.dirname(__FILE__) + '/../spec_helper'

module Codebreaker
  describe Generator do
    it "generates a four-element array" do
      generator = Generator.new
      generator.code.length.should == 4
    end
    
    it "only uses the game colors: r, y, g, c, b and w" do
      generator = Generator.new
      generator.code.each do |color|
        %w[r y g c b w].should include(color)
      end
    end
    
    it "uses each color no more than once in each code" do
      generator = Generator.new
      20.times { generator.code.uniq.length.should == 4 }
    end
    
    it "should generate a different code each time" do
      generator = Generator.new
      codes = (1..100).map { generator.code }
      codes.uniq.length.should >= 75
    end
  end
end
