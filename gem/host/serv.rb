module RubyOnServ
    module Host
        class Serv
            def self.start(ip,port,onstart)
                require 'socket'    
                server = TCPServer.new(ip.to_s,port.to_i)
                while session = server.accept
                    begin
                        request = session.gets
                        begin
                            http_method, path, protocol = request.split(' ')
                        rescue NoMethodError
                            
                        end
                        session.write "HTTP/1.1 200\r\n"
                        session.write "Content-Type: text/html\r\n"
                        session.write "\r\n"
                        if File.exist?("#{$dir}html#{path}.html")
                            page = "#{$dir}html#{path}.html"    
                        else
                            if File.exist?("#{$dir}html/page404.html")
                                page = "#{$dir}html/page404.html"
                            else
                                page = "#{$gem}/host/html/page404.html"
                            end
                        end
                        session.write File.readlines("#{$dir}/log/cache.txt")[0].chomp if @write_ip == true
                        if Dir.empty?("#{$dir}/html")
                            page = "#{$gem}/host/html/welcome.html"
                        end
                        display = ""
                        File.readlines(page).each do |lines|
                            display << lines
                        end
                        session.write display
                        @write_ip = false if @write_ip == true
                        Thread.start(server.accept) do |client|
                            log("L'ip : #{client.peeraddr[2].to_s} ,port : #{client.peeraddr[1].to_s} vien de se connecter a la page : #{File.basename(page)}.")
                            begin
                                if onstart.class == "Proc"
                                    onstart.call(client.peeraddr[2],client.peeraddr[1])
                                else
                                    onstart[File.basename(page,".html").to_sym].call(client.peeraddr[2],client.peeraddr[1])
                                end
                            rescue NoMethodError
                                
                            end
                        end
                    rescue Errno::EPIPE
                        log("Le serveur redemare.")
                        server.close
                        session.close
                        Serv.start(ip,port,onstart)
                    end
                end
            end
    
            def self.write_ip(ip)
                File.open("#{$dir}/log/cache.txt","w+") do |file|
                    file.write(ip.to_s)
                end
                @write_ip = true
            end
        end
    end
end