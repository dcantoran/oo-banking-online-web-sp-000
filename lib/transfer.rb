require 'pry'
class Transfer
  attr_accessor :sender 
  attr_reader :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 
  
  def valid? 
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    elsif !valid?
      status = "rejected"
      "Transaction rejected. Please check your account balance."
    end  
  end 
  
end
