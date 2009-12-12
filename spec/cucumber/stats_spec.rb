require File.dirname(__FILE__) + '/../spec_helper'
require File.dirname(__FILE__) + '/../../features/support/stats'

module Codebreaker
  describe Stats do
    context 'with 1 code with r in position 1' do
      before(:each) do
        @stats = Stats.new
        @stats.puts 'r g y c'
      end
      
      it "returns 1 when sent count_for('r', 1)" do
        @stats.count_for('r', 1).should == 1
      end
      
      it "returns 0 when sent count_for('y', 1)" do
        @stats.count_for('y', 1).should == 0
      end
    end
    
    context 'with 2 codes with r in position 1 twice and y in position 2 once' do
      before(:each) do
        @stats = Stats.new
        @stats.puts 'r g y c'
        @stats.puts 'r y g c'
      end
      
      it "returns 2 when sent count_for('r', 1)" do
        @stats.count_for('r', 1).should == 2
      end
      
      it "returns 0 when sent count_for('y', 1)" do
        @stats.count_for('y', 1).should == 0
      end
      
      it "returns 1 when sent count_for('y', 2)" do
        @stats.count_for('y', 2).should == 1
      end
    end
    
    context '#codes' do
      context 'with no codes' do
        it "should return an empty array" do
          stats = Stats.new
          stats.codes.should == []
        end
      end
      
      context 'with one code' do
        it "should return an array with that code (as an array of colors)" do
          stats = Stats.new
          stats.puts 'r y g c'
          stats.codes.should == [%w[r y g c]]
        end
      end
      
      context 'with several codes and other messages' do
        it "should return an array with all the codes" do
          stats = Stats.new
          stats.puts 'r y g c'
          stats.puts 'an arbitrary message'
          stats.puts 'b w y r'
          stats.puts 'another arbitrary message'
          stats.puts 'g w b c'
          stats.codes.should == [
            %w[r y g c],
            %w[b w y r],
            %w[g w b c]
          ]
        end
      end
    end
  end
end
