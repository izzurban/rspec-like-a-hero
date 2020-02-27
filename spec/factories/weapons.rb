FactoryBot.define do
  factory :weapon do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.paragraphs }
    power_base { FFaker::Random.rand(1..10000) }
    power_step { FFaker::Random.rand(1..1000) }
    level { FFaker::Random.rand(1..99) }
  end
end
