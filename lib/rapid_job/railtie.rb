require 'rapid_job'
require 'rails'
module RapidJob
  class Railtie < Rails::Railtie
    require 'rapid_job/worker'
  end
end
