require 'singleton'

class Rules
  include Singleton

  def engine(&block)
    @set = block
  end

  def run(product)
    @set.call(product)
  end
end
