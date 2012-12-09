# rbtw.rb
require "sinatra/base"
require "sinatra/reloader"
require "Pathname"
require "sinatra/config_file"

class Rbtw < Sinatra::Base
  register Sinatra::ConfigFile
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do

    timeline = ''
    Twitter.user_timeline("shigemk2")
      .each { |t|
      timeline += '<p>'
      timeline += t.text
      timeline += '</p>'
    }
    @twitter = timeline
    erb :dashboard
  end

end
