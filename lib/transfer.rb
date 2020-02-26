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
    if self.valid?
      receiver.balance += amount
      sender.balance -=amount
    else 
      
  end
  
end
