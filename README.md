flowpi
======

Listen to flows in Flowdock and speak messages matching a regexp.

Install
=======

```bash
    $ gem install flowpi
```

Run
---

```bash
    $ export FLOW_MATCH='/coffee|mo+rni+ng|morr+on|mo+rgo+n|buenos|beer|champagne/i'
    $ export FLOW_FILTER=example/flow1,example/flow2
    $ export FLOW_TOKEN=ififjejhatumlig3
    $ flowpi.rb
```

TODO
----

 * Docopts for config
 * Specs
 * Support espeak
