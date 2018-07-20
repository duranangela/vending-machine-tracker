require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
  it 'they see list of snack names and associated prices' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = Snack.create(name: 'Cheetos', price: 2, kind: 'chips')
    snack2 = Snack.create(name: 'Twix', price: 1, kind: 'candy')
    machine_snack1 = snack1.machine_snacks.create(machine_id: dons.id)
    machine_snack2 = snack2.machine_snacks.create(machine_id: dons.id)


    visit machine_path(dons)

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack2.price)
  end
end
