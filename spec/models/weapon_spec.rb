require 'rails_helper'

RSpec.describe Weapon, type: :model do
  context 'test for weapon current_power' do
    it 'test expected value of current power' do
      power_base = FFaker::Random.rand(1..10000)
      power_step = FFaker::Random.rand(1..1000)
      level = FFaker::Random.rand(1..99)
      weapon = build(:weapon, power_base: power_base, power_step: power_step, level: level)

      expect(weapon.current_power).to eq(power_base+((level-1)*power_step))
    end

    it 'test expected value of current power' do
      weapon = build(:weapon)
      expect(weapon.current_power).to eq(weapon.power_base+((weapon.level-1)*weapon.power_step))
    end

    it 'test expected value of current power with fixed value' do
      power_base = 3000
      power_step = 500
      level = 7
      weapon = build(:weapon, power_base: power_base, power_step: power_step, level: level)
      current_power_calculated = power_base+((level-1)*power_step) #6000

      expect(weapon.current_power).to eq(current_power_calculated)
    end
  end

  context 'tests for title' do
    it 'test for weapon title' do
      name = FFaker::Lorem.word
      level = FFaker::Random.rand(1..99)
      weapon = build(:weapon, name: name, level: level)

      expect(weapon.title).to eq("#{name}##{level}")
    end

    it 'test for weapon title#2' do
      weapon = build(:weapon)
      expect(weapon.title).to eq("#{weapon.name}##{weapon.level}")
    end
  end
end
