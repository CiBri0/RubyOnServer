module RubyOnServ
    require_relative "host/serv"
    require_relative "host/log"
    require_relative "client/make"
    def start_serv(ip,port,onstart)
        
        Serv.start(ip,port,onstart)
    end

    def def_dir(dir)
        $dir = dir
    end

    def write_ip(ip)
        Serv.write_ip(ip)
    end
    module_function :start_serv ,:def_dir
end
$gem = "#{File.dirname(__FILE__)}"
include RubyOnServ
include RubyOnServ::Host