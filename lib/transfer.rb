class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    end
    return false
  end

  def execute_transaction
    if self.valid?
      if self.sender.balance >= self.amount
        self.receiver.deposit(self.amount)
        self.sender.balance -= self.amount
      end
    end
  end

end
