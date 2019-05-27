require_relative '../book'
require_relative '../library'

require 'yaml'

=begin
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Disable the `expect` sytax...
    c.syntax = :should

    # ...or disable the `should` syntax...
    c.syntax = :expect

    # ...or explicitly enable both
    c.syntax = [:should, :expect]
  end
end
=end