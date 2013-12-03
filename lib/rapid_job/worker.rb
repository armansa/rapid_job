require 'amqp'

namespace :rapid do
  desc 'Start RapidJob worker in console'
  task :work do
    queue = ENV['queue'] || 'default'
    durable = (ENV['durable'] || 'true')=='true'
    subscribe = (ENV['subscribe'] || 'false')=='true'

    AMQP.start($config.mq) do |connection|

      q = AMQP::Channel.new(connection).queue(queue, :durable => durable)

      q.subscribe do |payload|
        begin
          message = JSON.parse payload
          object = message['type'].camelize.constantize.new(message['content'])
          object.send(message['method_name'],*(message['args']))
        rescue => e
          puts e.message
        end
      end

      Signal.trap('INT') do
        connection.close do
          EM.stop { exit }
        end
      end
    end
  end
end
