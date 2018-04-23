class Question
    attr_reader :first_number, :second_number

    def initialize()
        @first_number = rand(1..20)
        @second_number = rand(1..20) 
    end

    def correct?(input)
        if @first_number + @second_number == input
            return true
        end
        return false
    end
end