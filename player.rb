class Player
    attr_reader :name, :lives
    def initialize(name)
        @name = name
        @lives = 3
    end

    def reduce_lives
        @lives -= 1;
    end

    def to_s
        "Lives: #{@lives}"
    end
end
