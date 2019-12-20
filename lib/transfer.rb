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
    # sender.balance > @amount && receiver.status == "open"
    sender.valid? && receiver.valid?
    # binding.pry
  end 
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else 
      "Transaction rejected. Please check your account balance."
      status = "rejected"
    end  
  end 
  
end
