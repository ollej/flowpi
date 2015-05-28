flowpi
======

Listen to flows in Flowdock and speak messages matching a regexp.

Requirements
------------

Requires `espeak´ to synthesize. On Mac you can make an alias to the
´say´ command.

```bash
  alias espeak=say
```

Install
-------

```bash
    $ gem install flowpi
```

Run
---

```bash
    $ export FLOW_MATCH='coffee|mo+rni+ng|morr+on|mo+rgo+n|buenos|beer|champagne'
    $ export FLOW_FILTER=example/flow1,example/flow2
    $ export FLOW_TOKEN=ififjejhatumlig3
    $ export FLOW_LOG_FILE=/var/log/flowpi.log
    $ export FLOW_LOG_LEVEL=INFO
    $ flowpi.rb
```

TODO
----

 * Docopts for config
 * Specs
