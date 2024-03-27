# Usamos BDD(arquivo de  descrição do comportamento) para descrever o que queremos testar.
# O arquivo é dividido em cenários e cada cenário tem várias situações. onde ai sim poderemos
# aplicar o TDD(arquivo de  descrição da lógica).
# rspec -fd traz informação detalhada no terminal
# ctrl + f2 = selecionar items com msm nome

require_relative "../../Class/Class"

describe ContaCorrente do
  describe "Saque" do
    context "quando o valor e positivo" do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.sacar(200)
      end
      it "deve retornar o saldo atual da conta" do
        expect(@cc.saldo).to eq(795.00)
      end
    end

    context "quando o saldo e 0" do
      before(:all) do
        @cc = ContaCorrente.new(0.00)
        @cc.sacar(150.00)
      end
      it "Não deve ser possível sacar da conta" do
        expect(@cc.sacar(150.00)).to eq(false)
      end
      it "O saldo deve permanecer com o valor inicial" do
        expect(@cc.saldo).to eq(0.00)
      end
    end

    context "Quando o saldo e insuficiente" do
      before(:all) do
        @cc = ContaCorrente.new(100.00)
        @cc.sacar(200.00)
      end
      it "Não deve ser possivel receber o valor pedido" do
        expect(@cc.saldo).to eql 100.00
      end
    end

    context "O limite de saque foi atingido," do
      before(:all) do
        @cc = ContaCorrente.new(1000.00)
        @cc.sacar(750.00)
      end
      it "Limite de saque e de R$ 750.00" do
        expect(@cc.saldo).to eql 1000.00
      end
    end
  end
end
