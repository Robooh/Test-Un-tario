class ToyotaCarList
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(car)
    puts self.list.class
    self.list.push(car)
  end
end

#TDD (Test Driven Development Desenvolvimento guiado por testes)
describe ToyotaCarList do
  it "Deve ser adicionado um novo carro" do
    cl = ToyotaCarList.new

    cl.put("Trueno")
    expect(cl.list).to include "Trueno"
  end

  #Validadores

  it "Deve add uma lista de Car" do
    cl = ToyotaCarList.new
    cl.put("Supra")
    cl.put("Cannarelia")
    cl.put("Celica")

    res = cl.list.size > 0

    # expect(cl.list).to include "Celica"
    expect(cl.list.size).to be > 2
    expect(res).to be true
  end

  it "Celica deve ser o 1 da lista" do
    cl = ToyotaCarList.new

    cl.put("Celica")
    cl.put("Supra")
    cl.put("Cannarelia")
    cl.put("Trueno")

    expect(cl.list).to start_with("Celica")
    expect(cl.list).to end_with("Trueno")
  end

  #Matchers

  it "Deve conter a kmh max dos carros" do
    kmh = "320km/h"

    expect(kmh).to match("320")
    expect(kmh).not_to match("mph")
  end
end
