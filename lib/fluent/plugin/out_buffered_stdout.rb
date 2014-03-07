module Fluent
  class BufferedStdoutOutput < ObjectBufferedOutput
    Fluent::Plugin.register_output('buffered_stdout', self)

    OUTPUT_PROCS = {
      :json => Proc.new {|record| Yajl.dump(record) },
      :hash => Proc.new {|record| record.to_s },
    }

    config_param :output_type, :default => :json do |val|
      case val.downcase
      when 'json'
        :json
      when 'hash'
        :hash
      else
        raise ConfigError, "bufferd stdout output output_type should be 'json' or 'hash'"
      end
    end

    # Define `log` method for v0.10.42 or earlier
    unless method_defined?(:log)
      define_method("log") { $log }
    end

    def configure(conf)
      super
      @output_proc = OUTPUT_PROCS[@output_type]
    end

    def write_objects(tag, es)
      now = Time.now
      es.each {|time,record|
        log.write "#{now.localtime} #{Time.at(time).localtime} #{tag}: #{@output_proc.call(record)}\n"
      }
      log.flush
    end
  end
end
