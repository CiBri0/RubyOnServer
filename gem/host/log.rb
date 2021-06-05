module RubyOnServ
    module Host
        def log(log)
            File.open("#{$dir}/log/log.txt","a+") do |file|
                file.write("#{log} \n")
            end
        end
        
        def log_init()
            File.open("#{$dir}/log/log.txt","w+") {}
        end
    
        module_function :log ,:log_init
    end
end