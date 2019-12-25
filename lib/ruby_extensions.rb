require_relative 'ruby_extensions/version'
Dir[File.expand_path('ruby_extensions/*_ext.rb', __dir__)].each { |f| require_relative f }

module RubyExtensions
  class Error < StandardError; end
  # Your code goes here...
end
