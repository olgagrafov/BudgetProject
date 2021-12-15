require './model/expanse'

class User

    attr_accessor :name, :budget, :exp

    def initialize(name = "", budget = 0.0, exp =  Array.new(){Expanse.new})
      @name = name
      @budget = budget
      @exp = exp
    end

    def to_string
      puts  "Hello #{@name}! Your budget is #{@budget} $"
    end

    def to_hash
      {name: @name, budget: @budget, records: @exp}
    end

    def to_user(hash_user)
      @name = hash_user[:name]
      @budget = hash_user[:budget]
      @exp = hash_user[:records]
    end

    def print_budget(search_value = "")
      puts "Found #{@exp.length} records #{search_value} :"
      puts " ------------------- "
      total = 0.0
      @exp.each do |ex|
        tmp = Expanse.new()
        tmp.to_expanse(ex)
        total =  (tmp.type == "income") ?  total + tmp.amount.to_f : total - tmp.amount.to_f
        tmp.to_string()
      end
      puts " ------------------- "
      puts "total: #{total}&"
      puts " "
    end
  end

