class Question
    attr_reader :first_number, :second_number

    def initialize()
        @first_number = rand(1..20)
        @second_number = rand(1..20) 
    end

    def correct?(input)
        @first_number + @second_number == input
    end

    def get_formatted_question
        "What is #{@first_number} + #{@second_number}?"
    end
end