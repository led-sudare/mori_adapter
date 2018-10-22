require './led_map_transfer_factory'
require 'thread/pool'

class LEDController
    def initialize
      @content = {
        recv_port: 6666, 
        block_size: 8192,
        send_host: '192.168.0.10',
        send_port: 9001,
        enabled: false
      }
      @queue = Queue.new
      factory = LEDMapTransferFactory.new @queue
      Thread.new { factory.new_instance(@content).call }
    end
  
    def enable
      @content[:enbaled] = true
    end
    
    def disable
      @content[:enabled] = false
    end
end