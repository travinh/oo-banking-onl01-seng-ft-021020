class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    if @sender.valid? and @receiver.valid?
      true 
    else 
      false 
    end 
  end
  
  def execute_transaction
    if self.valid? and @sender.balance > @amount and @status== "pending"
      @receiver.balance += amount
      @sender.balance -=amount
      self.status = "complete"
    else 
      reject
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -=amount 
      @sender.balance +=amount
      @status = "reversed"
    end
  end
  
  def reject 
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
end
