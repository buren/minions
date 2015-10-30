require 'minions/version'
require 'minions/perform'

module Minions
  MAX = 20

  def self.in_parallel(work_packages, max: MAX, &block)
    Perform.in_parallel(work_packages, max: max, &block)
  end
end
