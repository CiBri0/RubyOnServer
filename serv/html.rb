class Html
    def self.gets_html_by_name(name)
        text = ""
        if File.exist?("../app/web/#{name}.html")
            File.readlines("../app/web/#{name}.html").each do |lines|
                text = text + "\n" + lines
            end
            return text
        end
        return name
    end
end