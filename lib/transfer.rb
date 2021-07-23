class Transfer
    # your code here
    attr_accessor :sender, :receiver, :status, :amount

    def initialize(sender, receiver, amount)
      self.sender = sender
      self.receiver = receiver
      self.status = "pending"
      self.amount = amount
    end      

    def valid?
      self.sender.valid? && self.receiver.valid?
    end

    def execute_transaction
      if self.sender.balance < self.amount || !self.valid? || self.status != "pending"
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end
    end

    def reverse_transfer
      if self.receiver.balance < self.amount || !self.valid? || self.status != "complete"
        "Reversal rejected."
      else
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        self.status = "reversed"
      end
    end

end
