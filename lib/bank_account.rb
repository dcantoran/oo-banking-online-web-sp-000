class BankAccount
  attr_accessor :status
  attr_reader :name 
  attr_writer :balance
  def initialize(name)
    @name = name 
    @balance = 1000
    @status = "open"
  end 
  
  def deposit(amount)
    @balance += amount
  end 
  
  def display_balance
    @balance 
  end 
  
end
