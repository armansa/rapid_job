module RapidJob
  class Job
    def metaclass
      class << self; self; end
    end

    def initialize type, content, attr
      @queue = attr[:queue] || 'default'
      @persisted = attr[:persisted]==false ? false : true
      @publish = attr[:publish] || false
      @queue_ttl = attr[:queue_ttl] || nil
      @message_ttl = attr[:message_ttl] || nil
      #    @dead_letter = attr[:dead_letter]
      #    @heart_beat = attr[:heart_beat]
      #    @run_at = attr[:run_at] || nil

      @max_attempts = attr[:max_attempts] || 1
      @attempt_counter = 0
      @content = content
      @type = type
    end

    def args= args
      @args = args
    end

    def method_name= method_name
      @method_name = method_name
    end

    def to_json
      {
        max_attempts: @max_attempts,
        attempt_counter: @attempt_counter,
        type: @type,
        content: @content,
        method_name: @method_name,
        args: @args,
      }.to_json
    end

    def enqueue
  #    if @queue_ttl
  #      q = $mq_channel.queue(@queue, :durable => @persisted, :arguments => { "x-message-ttl" => @queue_ttl }) unless @publish
  #      q = $mq_channel.fanout(@queue, :durable => @persisted, :arguments => { "x-message-ttl" => @queue_ttl }) if @publish
  #    else
        q = $mq_channel.queue(@queue, :durable => @persisted)# unless @publish
  #      q = $mq_channel.fanout(@queue, :durable => @persisted) if @publish
  #    end
  #    q.publish(self.to_json, :persisted => @persisted, :arguments => { "x-message-ttl" => @queue_ttl }) if @message_ttl
      q.publish(self.to_json, :persisted => @persisted)# if @message_ttl.nil?
    end
  end
end
