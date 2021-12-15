class Expanse
  @@array = Array.new
  attr_accessor :type, :description, :amount

  def self.all_instances
    @@array
  end

  def initialize(type = "", description = "", amount = 0.0)
    @type = type
    @description = description
    @amount = amount
    @@array << self
  end

  def type
    @type
  end

  def type= (type)
    @type = type
  end

  def description
    @description
  end

  def description= (description)
    @description = description
  end

  def amount
    @amount
  end

  def amount= (amount)
    @amount = amount
  end

  def to_hash
    {type: @type,description: @description, amount: @amount}
  end

  def to_string
    plus_or_minus = (@type == "income") ? "+" : "-"
    puts "#{@description} | #{plus_or_minus}#{@amount}$"
  end

  def to_expanse(hash_ex)
    @type = hash_ex[:type]
    @description = hash_ex[:description]
    @amount = hash_ex[:amount]
  end
end

