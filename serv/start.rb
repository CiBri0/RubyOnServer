require 'socket'
require_relative 'html.rb'
def start(ip,port,html)
  server = TCPServer.new(ip,port)
    while session = server.accept
		request = session.gets
		puts request
		session.print "HTTP/1.1 200\r\n"
		session.print "\r\n"
		session.print Html.gets_html_by_name(html)
		session.close
    end
end