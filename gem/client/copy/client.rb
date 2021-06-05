Dir.chdir(File.dirname(__FILE__))
$ip , $port = File.readlines("ip")

module RubyOnServ
    module Client
        class Serv
            def self.get(page)
                require "open-uri"
                return URI.open("#{$ip}:#{$port}/#{page}") {|web| web.read}
            end
        end
    end
end

include RubyOnServ::Client
puts Serv.get("test")