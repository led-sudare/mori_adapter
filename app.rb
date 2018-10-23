require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

require 'net/http'
require 'uri'

require './led_controller'

class App < Sinatra::Base
  register Sinatra::Reloader
  enable :sessions
  set :bind, '0.0.0.0' # 外部アクセス可
  set :port, 5001

  def initialize
    super
    @led_controller = LEDController.new 
  end

  post '/api/config' do
    params = JSON.parse request.body.read
    enable = params['enable']
    enable ? @led_controller.enable : @led_controller.disable
    return true 
  end
end
