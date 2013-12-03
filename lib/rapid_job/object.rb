class Object
  def rapid attr={}
    job = RapidJob::Job.new self.class.to_s, JSON.parse(self.to_json), attr
    methods = self.public_methods - self.class.superclass.instance_methods
    methods.each do |method_name|
      job.metaclass.send(:define_method, method_name) do |*args|
        self.method_name= method_name
        self.args= args
        self.enqueue
        self
      end
    end
    job
  end
end
