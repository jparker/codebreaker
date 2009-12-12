$LOAD_PATH << File.join(File.dirname(__FILE__), '..', 'lib')
require 'spec'
# require 'rr'
require 'codebreaker'

Spec::Runner.configure do |config|
  # config.mock_with :rr
end
