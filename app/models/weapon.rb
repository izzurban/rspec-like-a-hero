class Weapon < ApplicationRecord

    validates :power_base, numericality: {greater_than_or_equal_to: 0 }
    validates :power_step, numericality: {greater_than_or_equal_to: 0 }
    validates :level, numericality: {greater_than: 0 }

    def current_power
    power_base+((level-1)*power_step)
    end

    def title
    "#{self.name}##{self.level}"
    end

end
