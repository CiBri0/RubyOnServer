require_relative "../gem/require"
def_dir("dir de ton site")
log_init()

ip = "ip"
port = 5500
onloadtest = Proc.new() do |ip,port|
end

onload404 = Proc.new() do |ip,port|
end

hash = {
    page404: onload404 ,
    test: onloadtest
}
start_serv(ip,port,hash)
