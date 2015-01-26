require 'hipchat'

class Eye::Notify::Hipchat < Eye::Notify

  # Eye.config do
  #   hipchat token: '1312312', api_v: 1, username: 'eye bot'
  #   contact :info, :hipchat, 'room name'
  # end

  param :token, String, true
  param :api_v, String          # not required, if not specified, we're using v1
  param :username, String       # not required, if not specified, we're using 'Eye Bot'

  def execute
    say("<strong>#{message_subject}</strong><br>#{message_body}")
  end

  private

  def client
    version = api_v || 'v1'
    HipChat::Client.new(token, api_version: version)
  end

  def say(what)
    client[contact].send(username || 'Eye Bot', what, message_format: 'html')
  end

end
