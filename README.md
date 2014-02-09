# fluent-plugin-buffered-stdout

[Fluentd](http://fluentd.org) STDOUT output plugin with buffering. This plugin is for testing of buffer plugins only.

## Configuration

Same with `out_stdout` with buffering options.

```
<match data.**>
  type buffered_stdout
  output_type json     # default
  
  # buffering options
  buffer_type    memory  # default
  flush_interval 10s
</match>
```

## Copyright

* Copyright (c) 2013- TAGOMORI Satoshi (tagomoris)
* License
  * Apache License, Version 2.0
