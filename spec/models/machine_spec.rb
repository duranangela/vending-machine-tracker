require 'rails_helper'

describe Machine, type: :model do
  it 'gives average of all snack prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'Cheetos', price: 2, kind: 'chips')
    snack2 = Snack.create(name: 'Twix', price: 1, kind: 'candy')
    machine_snack1 = snack1.machine_snacks.create(machine_id: dons.id)
    machine_snack2 = snack2.machine_snacks.create(machine_id: dons.id)

    expected = 1.5

    expect(dons.avg_price).to eq(expected)
  end
end
