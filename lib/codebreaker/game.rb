module Codebreaker
  class Game
    def initialize(messenger)
      @messenger = messenger
    end
    
    def start(generator)
      @code = generator.code
      @messenger.puts "Welcome to Codebreaker!"
      @messenger.puts "Enter guess: "
    end
    
    def guess(guess)
      if guess == ['reveal']
        @messenger.puts @code.join(' ')
      else
        mark = [nil, nil, nil, nil]
        guess.each_with_index do |peg, index|
          if @code[index] == peg
            mark[index] = 'b'
          elsif @code.include?(peg)
            mark[@code.index(peg)] ||= 'w'
          end
        end
        @messenger.puts mark.compact.sort.join
      end
    end
  end
end
