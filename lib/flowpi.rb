require 'em-http'
require 'json'
require 'shellwords'

module Flow
  class Pi
    def initialize(options = {})
      @options = options
    end

    def run
      http = EM::HttpRequest.new(
        "https://stream.flowdock.com/flows?filter=#{@options[:filter]}",
        :keepalive => true, :connect_timeout => 0, :inactivity_timeout => 0)
      EventMachine.run do
        s = http.get(:head => { 'Authorization' => [@options[:token], ''], 'accept' => 'application/json'})

        buffer = ""
        s.stream do |chunk|
          buffer << chunk
          while line = buffer.slice!(/.+\r\n/)
            handle_line(line)
          end
        end
      end
    end

    def handle_line(line)
      message = Flow::Message.new.parse(line)
      if message.has_content?
        if message.content.match(@options[:message_matcher])
          puts "Speaking message: #{message.content}"
          msg = Shellwords.escape(message.content)
          %x(say '#{msg}'})
        else
          puts "Ignoring message: #{message.content}"
        end
      end
    end
  end

  class Message
    MESSAGE_TYPES = %w(message comment)

    def initialize(data = {})
      @data = data
    end

    def has_content?
      MESSAGE_TYPES.include?(@data['event'])
    end

    def parse(line)
      @data = JSON.parse(line)
      self
    end

    def content
      if @data['content'].kind_of?(Hash)
        @data['content']['text']
      else
        @data['content']
      end
    end
  end
end
