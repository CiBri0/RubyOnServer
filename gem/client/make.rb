module RubyOnServ
    module Client
        def make(ip,port)
            require 'fileutils'
            Dir.mkdir("#{$dir}/client") if Dir.exist?("#{$dir}/client") == false
            Dir.chdir(File.dirname(__FILE__))
            File.open("copy/ip","w+") do |file|
                file.write("#{ip}\n#{port}")
            end
            system("copy \"#{$gem}/client/copy/\" \"#{$dir}client\"")
            require_relative "copy/client.rb"
        end
        module_function :make
    end 
end