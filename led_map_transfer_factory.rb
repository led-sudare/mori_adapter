require 'socket'

class LEDMapTransferFactory
    def initialize(queue)
      @queue = queue
    end
  
    def new_instance(content)
      if(content[:recv_port] != nil)
        return lambda { transfer_from_sock(content) }
      else
        return lambda { transfer_from_queue(content) }
      end
    end
  
    private
  
    def transfer_from_sock(content)
      UDPSocket.open do |recv_sock|
        recv_sock.bind('0.0.0.0', content[:recv_port])
        transfer content, lambda { recv_sock.recv(content[:block_size]) }
      end
    end
  
    def transfer_from_queue(content)
      transfer content, lambda { @queue.pop }
    end
  
    def transfer(content, producer)
      UDPSocket.open do |send_sock|
        send_sock_addr = Socket.pack_sockaddr_in(content[:send_port], content[:send_host])
        while d = producer.call
          next unless content[:enabled]
          send_sock.send(d, 0, send_sock_addr)
        end
      end
    end
  end