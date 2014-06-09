require "bunny"

require "rapid_job/version"
require "rapid_job/job"
require "rapid_job/task"
require 'rapid_job/railtie' if defined?(Rails)

module Rapid
  class << self
    def get_channel
      conn = Bunny.new
      conn.start
      conn.create_channel
    end
  end
end
