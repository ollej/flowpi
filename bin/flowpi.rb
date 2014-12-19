#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'flowpi'

Flowpi::Server.new(
  token: ENV.fetch('FLOW_TOKEN'),
  filter: ENV.fetch('FLOW_FILTER'),
  message_matcher: Regexp.new(ENV.fetch('FLOW_MATCH')),
).run
