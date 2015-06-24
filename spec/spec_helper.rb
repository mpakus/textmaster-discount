require_relative 'checkout_helper'

$LOAD_PATH << '../lib'

RSpec.configure do |config|
  config.color = true
  config.include CheckoutHelper
end
