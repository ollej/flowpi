require 'eventmachine'
require 'em-http'
require 'json'

token = '5492df20916ed57593642b7de6e8408d'
organization = 'avidity'
flow = 'promote'

#{
# "event"=>"message",
# "tags"=>
# [
#  ":highlight:24480",
#  ":unread:24480",
#  ":highlight:56435",
#  ":unread:56435"
# ],
# "uuid"=>"4qJ830tUONDSoktB",
# "id"=>1729815,
# "flow"=>"avidity:promote",
# "content"=>"Felix and Jenny finally tried the Mochi cookie. They didn’t like it. =P",
# "sent"=>1400247857204,
# "app"=>"chat",
# "attachments"=>[],
# "user"=>"34679"
# }

MESSAGE_TYPES = %w(message comment)
MESSAGE_MATCHER = 'coffee'

http = EM::HttpRequest.new(
  "https://stream.flowdock.com/flows/#{organization}/#{flow}",
  :keepalive => true, :connect_timeout => 0, :inactivity_timeout => 0)
EventMachine.run do
  s = http.get(:head => { 'Authorization' => [token, ''], 'accept' => 'application/json'})

  buffer = ""
  s.stream do |chunk|
    buffer << chunk
    while line = buffer.slice!(/.+\r\n/)
      message = JSON.parse(line)
      if MESSAGE_TYPES.include?(message['event'])
        puts message.inspect
        if message['content'].kind_of?(Hash)
          msg = message['content']['text']
        else
          msg = message['content']
        end
        #if msg.gsub!(/^say:\s*/, '')
        if msg.include?(MESSAGE_MATCHER)
          puts "Speaking message: #{msg}"
          %x(say '#{msg}'})
        else
          puts "Ignoring message: #{msg}"
        end
      end
    end
  end
end
