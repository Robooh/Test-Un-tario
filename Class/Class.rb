class Conta
  attr_accessor :saldo, :mensagem

  def initialize(saldo)
    self.saldo = saldo
    self.mensagem = ""
  end

  def sacar(valor, max = 700, taxa = 5.00)
    if valor > self.saldo
      return false
    elsif (valor > max)
      self.mensagem = "Limite maximo de saque e de R$ " + max.to_s
    else
      self.saldo -= valor + taxa
    end
    valor
  end
end

class ContaCorrente < Conta
  def sacar(valor, max = 700, taxa = 5.00)
    success = super(valor, max, taxa)
    if success
      self.mensagem += ", Saque realizado com sucesso na Cc"
    end
    success
    end
end

class ContaPoupanca < Conta
  def sacar(valor, max = 500, taxa = 3.00)
    success = super(valor, max, taxa)
      if success
        self.mensagem += ", Saque realizado com sucesso na Cp"
      end
      success
  end
end
