require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid? 
    sender.balance > @amount && receiver.status == "open"
    sender.valid? && receiver.valid?
    # binding.pry
  end 
  
  def execute_transaction
    1.times do 
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      break
    end 
    if @sender.balance < @amount || !self.valid?
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
end
