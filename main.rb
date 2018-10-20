require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

require 'net/http'
require 'uri'
require 'thread/pool'
require 'socket'

class App < Sinatra::Base
  register Sinatra::Reloader
  enable :sessions
  set :bind, '0.0.0.0' # 外部アクセス可

  def initialize
    super
    @led_controller = LEDController.new 
  end

  post '/api/config' do
    enable = params['enable']
    enable ? @led_controller.enable : @led_controller.disable
    return true 
  end
end

class LEDController
  def initialize
    @content = {
        recv_port: 8192
        send_host: '192.168.0.10'
        send_port: 9001
        enabled: true
    }
    @queue = Queue.new
    factory = LEDMapTransferFactory.new @queue
    Thread.new { factory.new_instance(content).call }
    # for test
    # Thread.new { loop { recv_map_dummy() } }
  end
  
  def enable
    @content[:enbaled] = true
  end
  
  def disable
    @content[:enabled] = false
  end
end

class LEDMapTransferFactory
  def initialize(queue)
    @queue = queue
  end

  def new_instance(content)
    if(content[:recv_port] != nil)
      # for test
      # puts "create sock: " + content[:id]
      return lambda { transfer_from_sock(content) }
    else
      # for test
      # puts "create queue: " + content[:id]
      return lambda { transfer_from_queue(content) }
    end
  end

  private

  def transfer_from_sock(content)
    UDPSocket.open do |recv_sock|
      recv_sock.bind('0.0.0.0', content[:port])
      transfer content, lambda { recv_sock.recv(content[:recv_port]) }
    end
  end

  def transfer_from_queue(content)
    transfer content, lambda { @queue.pop }
  end

  def transfer(content, producer)
    UDPSocket.open do |send_sock|
      # for test
      send_sock_addr = Socket.pack_sockaddr_in(content[:send_port], content[:send_host])
      # send_sock_addr = Socket.pack_sockaddr_in(9001, '127.0.0.1')
      while d = producer.call
        next unless content[:enabled]
        send_sock.send(d, 0, send_sock_addr)
      end
    end
  end
end
