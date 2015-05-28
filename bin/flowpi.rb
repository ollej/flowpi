#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'flowpi'

Flowpi::Server.new(
  token: ENV.fetch('FLOW_TOKEN'),
  filter: ENV.fetch('FLOW_FILTER'),
  message_matcher: Regexp.new(ENV.fetch('FLOW_MATCH'), Regexp::IGNORECASE),
  log_file: ENV.fetch('FLOW_LOG_FILE', nil),
  log_level: ENV.fetch('FLOW_LOG_LEVEL', 'WARN'),
  log_date_format: ENV['FLOW_LOG_DATE_FORMAT'],
).run
