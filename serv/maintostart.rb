require_relative "start.rb"
require_relative "../app/ruby/main.rb"
if HTML.class == "".class
    html = HTML
else
    html = "<style>body {background-color: 000000}</style>"
end
start(IP,PORT,html)