class String
    def trim
        self.sub("\n", "")
    end

    def explode
        self.split("\n")
    end

    def split_dirs
        self.sub(":", "\n")
    end

    def basename
        `basename "#{self}"`.trim
    end

    def yellow
        colorize(33)
    end

    def green
        colorize(32)
    end

    def blue
        colorize(34)
    end

    private
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
end
