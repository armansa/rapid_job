rapid_job
=========

RapidJob is a RabbitMQ-backed Ruby library for creating background jobs, placing them on multiple queues, and processing them rapidly.

It's not complete yet!

Any class can include Rapid::Job.
<pre>
class MyJob
  include Rapid::Job

  def to_json
    '{}'
  end

  def f
    puts 'hey hey hey, f is called'
  end

  def self.g
    puts 'hey hey hey, g is called'
  end
end
</pre>

Then it's functions can be called in background:
<pre>
mg = MyJob.new
mg.rapid.f

MyJob.rapid.g
</pre>

To pop messages from MQ and run:
<pre>
rake rapid:worker QUEUE=my_job
</pre>
