require_relative "../../Class/Class"

describe ContaPoupanca do
  describe "Saque" do
    context "quando o valor e positivo" do
      before(:all) do
        @cp = ContaPoupanca.new(1000.00)
        @cp.sacar(200)
      end
      it "deve retornar o saldo atual da conta" do
        expect(@cp.saldo).to eq(797.00)
      end
    end

    context "quando o saldo e 0" do
      before(:all) do
        @cp = ContaPoupanca.new(0.00)
        @cp.sacar(150.00)
      end
      it "Não deve ser possível sacar da conta" do
        expect(@cp.sacar(150.00)).to eq(false)
      end
      it "O saldo deve permanecer com o valor inicial" do
        expect(@cp.saldo).to eq(0.00)
      end
    end

    context "Quando o saldo e insuficiente" do
      before(:all) do
        @cp = ContaPoupanca.new(100.00)
        @cp.sacar(200.00)
      end
      it "Não deve ser possivel receber o valor pedido" do
        expect(@cp.saldo).to eql 100.00
      end
    end

    context "O limite de saque foi atingido," do
      before(:all) do
        @cp = ContaPoupanca.new(1000.00)
        @cp.sacar(750.00)
      end
      it "Limite de saque e de R$ 500.00" do
        expect(@cp.saldo).to eql 1000.00
      end
    end
  end
end
