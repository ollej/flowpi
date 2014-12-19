require_relative 'lib/flowpi'

Flow::Pi.new(
  token: ENV.fetch('FLOW_TOKEN'),
  filter: 'avidity/main,avidity/promote',
  message_matcher: /coffee|mo+rni+ng|morr+on|mo+rgo+n|buenos|beer|champagne/i,
).run
