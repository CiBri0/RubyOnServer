require_relative "../gem/require"
def_dir(dir principale)
log_init()

ip = "ip"
port = 5500
onstart = Proc.new() do |ip,port,page|

end

start_serv(ip,port,onstart)