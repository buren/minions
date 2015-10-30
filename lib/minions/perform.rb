module Minions
  class Perform
    def initialize(work_packages, max:, &block)
      @work_packages = work_packages
      @max = [max, work_packages.length].min
      @work_block = block
    end

    def self.in_parallel(*args, &block)
      new(*args, &block).send(:in_parallel)
    end

    private

    attr_reader :work_packages, :max

    def in_parallel
      (0...max).map do
        Thread.new do
          begin
            while package = work_queue.pop(true)
              @work_block.call(package)
            end
          rescue ThreadError
            # The queue is empty
          end
        end
      end.map(&:join)
    end

    def work_queue
      @_work_queue ||= begin
        queue = Queue.new
        work_packages.each { |package| queue << package }
        queue
      end
    end
  end
end
